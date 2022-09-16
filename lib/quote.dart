import 'package:http/http.dart' as http;
import 'dart:convert';

class Quote {
  Quote({this.anime, this.quoteText});
  var anime;
  var quoteText;
  Future<void> fetchQuotes() async {
    final url = Uri.parse("https://animechan.vercel.app/api/random");
    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw Exception("Error in getting quote data.");
    }
    final responseJSON = jsonDecode(response.body);
    anime = responseJSON["anime"];
    quoteText = responseJSON["quote"];
  }
}
