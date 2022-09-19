import 'package:flutter/material.dart';
import 'package:quotes/src/common_widgets/quote.dart';
import 'package:quotes/src/common_widgets/anime_chan_api_client.dart';
import 'package:quotes/src/common_widgets/quote_card.dart';

class QuotesApp extends StatefulWidget {
  const QuotesApp({Key? key}) : super(key: key);

  @override
  State<QuotesApp> createState() => _quotesAppState();
}

// Global Variable
List<Quote> quotesList = [];

class _quotesAppState extends State<QuotesApp> {
  void setUpQuotesList() async {
    AnimeChanApiClient api = AnimeChanApiClient();
    List<Quote> listQuotes = [
      for (var i = 0; i < 5; i++) await api.fetchQuote()
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
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            title: const Text(
              'Anime Quotes',
              style: TextStyle(fontSize: 20.0),
            ),
            // backgroundColor: Colors.grey[700],
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
                          print(quotesList.length);
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
