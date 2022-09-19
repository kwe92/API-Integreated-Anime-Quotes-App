// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'quote.dart';
import 'package:quotes/src/constants/layout.dart';
import 'package:google_fonts/google_fonts.dart';

class QuoteCard extends StatelessWidget {
  const QuoteCard({required this.quote, required this.delete});
  final Quote quote;
  final Function delete;
  final style = const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200],
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.all(2),
              child: Text(
                quote.quoteText,
                style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: "Quicksand",
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: Text(
                '- ${quote.anime}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32.0,
                    fontFamily: "Estonia"),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            ElevatedButton.icon(
              onPressed: () {
                delete();
              },
              icon: Icon(
                Icons.delete,
                size: 16,
              ),
              label: Text(
                'Delete Quote',
                style: TextStyle(fontSize: 26.0, fontFamily: Fonts.main),
              ),
              style: ElevatedButton.styleFrom(primary: BackgroundColors.main),
            ),
          ],
        ),
      ),
    );
  }
}
