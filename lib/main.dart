// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:quotes/quote.dart';
import 'quoteCard.dart';

void main() {
  return runApp(
    MaterialApp(
      home: quotesApp(),
    ),
  );
}

class quotesApp extends StatefulWidget {
  const quotesApp({Key? key}) : super(key: key);

  @override
  State<quotesApp> createState() => _quotesAppState();
}

//todo: Figure out how to pass api data to app - (complete)
// todo: fix api bugs

List<Quote> quotesList = [];

class _quotesAppState extends State<quotesApp> {
  void setUpQuotesList() async {
    List<Quote> listQuotes = [];

    for (var i = 0; i < 5; i++) {
      Quote q = Quote();
      await q.fetchQuotes();
      listQuotes.add(q);
    }
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
            title: Text(
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
