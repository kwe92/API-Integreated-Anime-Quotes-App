@Timeout(Duration(seconds: 10))

import 'package:flutter_test/flutter_test.dart';
import 'package:quotes/src/features/quotepage/data/anime_chan_repository.dart';
import 'package:quotes/src/features/quotepage/domain/quote.dart';

void main() {
  late final AnimeChanRepository animeChanRepository;
  setUp(() {
    animeChanRepository = const AnimeChanRepository();
  });
  group('Anime Chan Repository', () {
    test('fetchQuoteList(length: 1) returns [Quote]', () async {
      final result = await animeChanRepository.fetchQuoteList(length: 1);
      expect(result, [isA<Quote>()]);
    });

    test('fetchQuoteListByTitle(Avatar) returns Future<List<Quote>>', () async {
      final result = animeChanRepository.fetchQuoteListByTitle('Avatar');
      expect(result, isA<Future<List<Quote>>>());
    });
  });
}
