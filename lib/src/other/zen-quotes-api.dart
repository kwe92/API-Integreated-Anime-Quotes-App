import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';

class Quote {
  Quote({this.author, this.quoteText});
  var author;
  var quoteText;
  final _rand = Random().nextInt(50);

  Future<void> fetchQuotes() async {
    //final url = Uri.parse("https://zenquotes.io/api/quotes"); // 50 quotes
    final url =
        Uri.parse("https://zenquotes.io/api/quotes"); // generates random quote

    final response = await http.get(url);
    // the server sending status code 200 means a successful response
    if (response.statusCode != 200) {
      // the calling code should catch this error if it is thrown
      throw Exception("Error in getting quote data.");
    }
    // response.body
    //    - the body of a response as a string
    final responseJSON = jsonDecode(response.body);
    author = responseJSON[_rand]['a'];
    quoteText = responseJSON[_rand]['q'];
  }
}
