import 'dart:io';
import 'package:flutter/material.dart';
import 'package:quotes/src/features/quotepage/quote.dart';
import 'package:quotes/src/network/anime_chan_api_client.dart';
import 'package:quotes/src/features/quotepage/quote_card.dart';
import 'package:quotes/src/constants/layout.dart';

class QuotesApp extends StatefulWidget {
  const QuotesApp({Key? key}) : super(key: key);

  @override
  State<QuotesApp> createState() => _QuotesAppState();
}

class _QuotesAppState extends State<QuotesApp> {
  List<Quote> quotesList = [];

  void setUpQuotesList() async {
    List<Quote> listQuotes = [
      for (var i = 0; i < 4; i++) await AnimeChanApiClient.fetchQuote()
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
              style: TextStyle(fontSize: Sizes.p42, fontFamily: Fonts.main),
            ),
            backgroundColor: BackgroundColors.main,
          ),
          body: ListView.builder(
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
                          setUpQuotesList();
                        }
                      });
                    });
              })),
    );
  }
}
