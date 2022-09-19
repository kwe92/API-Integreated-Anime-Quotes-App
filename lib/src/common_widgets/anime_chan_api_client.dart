// https://animechan.vercel.app/api/random
import 'package:http/http.dart' as http;
import 'package:quotes/src/common_widgets/quote.dart';
import 'dart:convert';

class AnimeChanApiClient {
  static const uri = "https://animechan.vercel.app/api/random";
  Future<Quote> fetchQuote() async {
    final url = Uri.parse(uri);
    final response = await http.get(url);
    final json = jsonDecode(response.body);
    return Quote.fromJSON(json);
  }
}
