// https://animechan.vercel.app/api/random
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
  static const uri = "https://animechan.vercel.app/api/random";
  static Future<Quote> fetchQuote() async {
    final url = Uri.parse(uri);
    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw FetchError(statusCode: response.statusCode);
    }
    final json = jsonDecode(response.body);
    final result = Quote.fromJSON(json);
    return result;
  }
}
