// https://animechan.vercel.app/api/random
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  static Future<Quote> _fetchQuoteData() async {
    const uri = "https://animechan.vercel.app/api/random";
    final url = Uri.parse(uri);
    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw FetchError(statusCode: response.statusCode);
    }
    final json = jsonDecode(response.body);
    final result = Quote.fromJSON(json);
    return result;
  }

  Future<List<Quote>> fetchQuoteList() async {
    List<Quote> listQuotes = [
      for (var i = 0; i < 3; i++) await _fetchQuoteData()
    ];
    return listQuotes;
  }
}

final animeChanRepoProvider = Provider<AnimeChanApiClient>((ref) {
  return AnimeChanApiClient();
});

final AutoDisposeFutureProvider<List<Quote>> animeQuoteListProvider =
    FutureProvider.autoDispose((FutureProviderRef ref) {
  final AnimeChanApiClient animeChanProvider = ref.watch(animeChanRepoProvider);
  return animeChanProvider.fetchQuoteList();
});
