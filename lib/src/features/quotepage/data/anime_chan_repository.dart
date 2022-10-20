// https://animechan.vercel.app/api/random
// https://animechan.vercel.app/api/quotes/anime?title=naruto
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:quotes/src/features/quotepage/domain/quote.dart';
import 'dart:convert';

class FetchError {
  const FetchError(
      {this.message = " Unable to fetch data |", required this.statusCode})
      : super();
  final String message;
  final int statusCode;

  @override
  String toString() => "$message Status Code: $statusCode";
}

class AnimeChanRepository {
  const AnimeChanRepository();
  Future<Quote> _fetchQuoteData() async {
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

  Future<List<Quote>> fetchQuoteList({int length = 3}) async {
    List<Quote> listQuotes = [
      for (var i = 0; i < length; i++) await _fetchQuoteData()
    ];
    return listQuotes;
  }

  Future<List<Quote>> fetchQuoteListByTitle(String title) async {
    final uri = "https://animechan.vercel.app/api/quotes/anime?title=$title";
    final url = Uri.parse(uri);
    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw FetchError(statusCode: response.statusCode);
    }
    final jsonList = jsonDecode(response.body);
    return [for (var json in jsonList) Quote.fromJSON(json)];
  }
}

final animeChanRepoProvider = Provider<AnimeChanRepository>((ref) {
  return const AnimeChanRepository();
});

final animeQuoteListProvider =
    FutureProvider.autoDispose.family((ref, String title) {
  final AnimeChanRepository animeChanProvider =
      ref.watch(animeChanRepoProvider);
  if (title.isEmpty) {
    ref.onDispose(() {
      debugPrint('Disposed animeQuoteListProvider');
    });
    return animeChanProvider.fetchQuoteList();
  }
  ref.onDispose(() {
    debugPrint('Disposed animeQuoteListProvider');
  });
  return animeChanProvider.fetchQuoteListByTitle(title);
});
