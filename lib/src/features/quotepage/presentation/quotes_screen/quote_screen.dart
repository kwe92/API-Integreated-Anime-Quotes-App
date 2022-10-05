import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quotes/src/features/quotepage/data/anime_chan_api_client.dart';
import 'package:quotes/src/features/quotepage/presentation/quotes_screen/loading_screen.dart';
import 'package:quotes/src/common_widgets/base_layout.dart';
import 'package:quotes/src/features/quotepage/presentation/quotes_screen/error_screen.dart';
import 'package:quotes/src/features/quotepage/presentation/quotes_screen/quote_card.dart';
import 'package:quotes/src/constants/layout.dart';

//TODO: Add an image for loading screens
//TODO: Add Error Screen
//TODO: Custom Bottom Page Widget

class QuotesScreen extends ConsumerStatefulWidget {
  const QuotesScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<QuotesScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends ConsumerState<QuotesScreen> {
  final _animeTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final quoteListValue =
        ref.watch(animeQuoteListProvider(_animeTitleController.text));
    return RefreshIndicator(
      onRefresh: () async {
        ref.refresh(animeQuoteListProvider(_animeTitleController.text));
        await Future.delayed(const Duration(milliseconds: 700));
        return Future.value();
      },
      child: quoteListValue.when(
        data: (quotesList) => ScreenLayout(
          body: Padding(
            padding: const EdgeInsets.fromLTRB(0, Sizes.p16, 0, 0),
            child: Column(
              children: [
                Expanded(
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
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(
                            Sizes.p26, 0, Sizes.p26, 0),
                        child: MaterialButton(
                          onPressed: () {
                            showModalBottomSheet(
                                backgroundColor: Colors.grey[300],
                                context: context,
                                builder: (context) => Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 15, 0, 0),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            ListTile(
                                              title: TextFormField(
                                                controller:
                                                    _animeTitleController,
                                                decoration: InputDecoration(
                                                  label: const Text(
                                                      'Enter a anime...'),
                                                  hintText:
                                                      'eg: Bleach, Naruto, One Piece...',
                                                  border:
                                                      const OutlineInputBorder(),
                                                  suffixIcon: IconButton(
                                                    onPressed: () {
                                                      _animeTitleController
                                                          .clear();
                                                    },
                                                    icon:
                                                        const Icon(Icons.clear),
                                                  ),
                                                ),
                                                keyboardType:
                                                    TextInputType.name,
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .fromLTRB(Sizes.p26,
                                                        0, Sizes.p26, 0),
                                                    child: MaterialButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          ref.refresh(
                                                              animeQuoteListProvider(
                                                                  _animeTitleController
                                                                      .text));
                                                        });
                                                        Navigator.pop(context);
                                                      },
                                                      color:
                                                          BackgroundColors.main,
                                                      child: const Text(
                                                        'Search by Title',
                                                        style: TextStyle(
                                                            fontSize: Sizes.p26,
                                                            fontFamily:
                                                                Fonts.main,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ]),
                                    ));
                          },
                          color: BackgroundColors.main,
                          child: const Text('Search by Title',
                              style: TextStyle(
                                  fontSize: Sizes.p26,
                                  fontFamily: Fonts.main,
                                  color: Colors.white)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        error: (error, strackTrace) => ErrorScreen(error: error),
        loading: () => const LoadingScreen(),
      ),
    );
  }
}
