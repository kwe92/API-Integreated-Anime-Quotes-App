// https://animechan.vercel.app/api/random
import 'package:http/http.dart' as http;
import 'package:quotes/src/common_widgets/quote.dart';
import 'fetcherror.dart';
import 'dart:convert';

class AnimeChanApiClient {
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
