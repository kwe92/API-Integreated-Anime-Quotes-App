import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quotes/src/features/quotepage/data/anime_chan_api_client.dart';
import 'package:quotes/src/features/quotepage/presentation/quotes_screen/quote_card.dart';
import 'package:quotes/src/constants/layout.dart';

class QuotesApp extends ConsumerStatefulWidget {
  const QuotesApp({Key? key}) : super(key: key);

  @override
  ConsumerState<QuotesApp> createState() => _QuotesAppState();
}

class _QuotesAppState extends ConsumerState<QuotesApp> {
  final _animeTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final quoteListValue =
        ref.watch(animeQuoteListProvider(_animeTitleController.text));
    return quoteListValue.when(
      data: (quotesList) => SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[300],
          appBar: AppBar(
            title: const Text(
              'Anime Quotes',
              style: TextStyle(
                fontSize: Sizes.p42,
                fontFamily: Fonts.main,
              ),
            ),
            backgroundColor: BackgroundColors.main,
          ),
          body: Padding(
            padding: const EdgeInsets.fromLTRB(0, Sizes.p16, 0, 0),
            child: Column(
              children: [
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () {
                      return ref.refresh(animeQuoteListProvider(
                          _animeTitleController.text)) as Future;
                    },
                    child: ListView.builder(
                      itemCount: quotesList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return QuoteCard(
                            quote: quotesList[index],
                            delete: () {
                              setState(() {
                                if (quotesList.length > 1) {
                                  quotesList.removeAt(index);
                                  stdout.write("${quotesList.length}\n");
                                } else {
                                  quotesList.removeAt(index);
                                  ref.refresh(animeQuoteListProvider(
                                      _animeTitleController.text));
                                }
                              });
                            });
                      },
                    ),
                  ),
                ),
                ListTile(
                  title: TextFormField(
                    controller: _animeTitleController,
                    decoration: InputDecoration(
                      label: const Text('Enter a anime...'),
                      hintText: 'eg: Bleach, Naruto, One Piece...',
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {
                          _animeTitleController.clear();
                        },
                        icon: const Icon(Icons.clear),
                      ),
                    ),
                    keyboardType: TextInputType.name,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(
                            Sizes.p26, 0, Sizes.p26, 0),
                        child: MaterialButton(
                          onPressed: () {
                            setState(() {
                              ref.refresh(animeQuoteListProvider(
                                  _animeTitleController.text));
                            });
                          },
                          color: BackgroundColors.main,
                          child: const Text(
                            'Search by Title',
                            style: TextStyle(
                                fontSize: Sizes.p26,
                                fontFamily: Fonts.main,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      error: (error, strackTrace) => Center(
        child: ErrorWidget(error.toString()),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
