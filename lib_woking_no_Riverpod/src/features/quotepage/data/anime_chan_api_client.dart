// https://animechan.vercel.app/api/random
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quotes/src/features/quotepage/domain/quote.dart';
import 'dart:convert';

class FetchError {
  const FetchError(
      {this.message = "Unable to fetch data |", required this.statusCode})
      : super();
  final String message;
  final int statusCode;

  @override
  String toString() => "$message Status Code: $statusCode";
}

class AnimeChanApiClient {
  AnimeChanApiClient._();

  static Future<Object> fetchQuote({String? title}) async {
    if (title == null) {
      const uri = "https://animechan.vercel.app/api/random";
      final url = Uri.parse(uri);
      final response = await http.get(url);
      if (response.statusCode != 200) {
        throw FetchError(statusCode: response.statusCode);
      }
      final json = jsonDecode(response.body);
      final result = Quote.fromJSON(json);
      return result;
    } else {
      List<Quote> quoteList = [];
      final uri = "https://animechan.vercel.app/api/quotes/anime?title=$title";
      final url = Uri.parse(uri);
      final response = await http.get(url);
      if (response.statusCode != 200) {
        throw FetchError(statusCode: response.statusCode);
      }
      final List jsonList = jsonDecode(response.body);
      jsonList.toSet().toList();
      for (var json in jsonList.toSet().toList().getRange(0, 3)) {
        quoteList.add(
          Quote.fromJSON(json),
        );
      }
      return quoteList;
    }
  }
}
