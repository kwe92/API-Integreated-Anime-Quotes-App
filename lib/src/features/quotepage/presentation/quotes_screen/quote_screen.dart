import 'dart:io';
import 'package:flutter/material.dart';
import 'package:quotes/src/features/quotepage/domain/quote.dart';
import 'package:quotes/src/features/quotepage/data/anime_chan_api_client.dart';
import 'package:quotes/src/features/quotepage/presentation/quotes_screen/quote_card.dart';
import 'package:quotes/src/constants/layout.dart';

class QuotesApp extends StatefulWidget {
  const QuotesApp({Key? key}) : super(key: key);

  @override
  State<QuotesApp> createState() => _QuotesAppState();
}

class _QuotesAppState extends State<QuotesApp> {
  List<Object?> quotesList = [];
  final _animeTitleController = TextEditingController();

  void setUpQuotesListTitle(String title) async {
    final quotesListTitle =
        await AnimeChanApiClient.fetchQuote(title: title) as List<Object?>;
    setState(() {
      quotesList = quotesListTitle;
    });
  }

  void setUpQuotesList() async {
    List<Object?> listQuotes = [
      for (var i = 0; i < 3; i++) await AnimeChanApiClient.fetchQuote()
    ];

    setState(() {
      quotesList = listQuotes;
    });
  }

  void delete(quote) {
    setState(() {
      quotesList.remove(quote);
    });
  }

  @override
  void initState() {
    super.initState();
    setUpQuotesList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
          padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: quotesList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return QuoteCard(
                        quote: quotesList[index] as Quote,
                        delete: () {
                          setState(() {
                            if (_animeTitleController.text.isEmpty) {
                              if (quotesList.length > 1) {
                                quotesList.removeAt(index);
                                stdout.write("${quotesList.length}\n");
                              } else {
                                quotesList.removeAt(index);
                                setUpQuotesList();
                              }
                            } else {
                              if (quotesList.length > 1) {
                                quotesList.removeAt(index);
                                stdout.write("${quotesList.length}\n");
                              } else {
                                quotesList.removeAt(index);
                                setUpQuotesListTitle(
                                    _animeTitleController.text);
                              }
                            }
                          });
                        });
                  },
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
                      padding:
                          const EdgeInsets.fromLTRB(Sizes.p26, 0, Sizes.p26, 0),
                      child: MaterialButton(
                        onPressed: () {
                          setUpQuotesListTitle(_animeTitleController.text);
                        },
                        color: BackgroundColors.main,
                        child: const Text(
                          'Search',
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
    );
  }
}
