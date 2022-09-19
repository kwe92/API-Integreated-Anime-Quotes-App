// https://animechan.vercel.app/api/random

import 'package:http/http.dart' as http;
import 'dart:convert';

class AnimeChanApiClient {
  static const uri = "https://animechan.vercel.app/api/random";

  Future<AnimeQuote> fetchQuote() async {
    final url = Uri.parse(uri);
    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw Exception("Unable to fetch data: ${response.statusCode}");
    }
    final json = jsonDecode(response.body);
    return AnimeQuote.fromJSON(json);
  }
}

class AnimeQuote {
  const AnimeQuote({required this.anime, required this.quote});
  final anime;
  final quote;

  factory AnimeQuote.fromJSON(Map<String, Object?> json) =>
      AnimeQuote(anime: json["anime"], quote: json["quote"]);

  @override
  String toString() => """

Quote:

$quote

    - $anime

""";
}

Future<int> main() async {
  final AnimeChanApiClient api = AnimeChanApiClient();
  final AnimeQuote quote = await api.fetchQuote();
  print(quote);
  return 0;
}
