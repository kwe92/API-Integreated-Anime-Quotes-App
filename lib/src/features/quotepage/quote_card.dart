import 'package:flutter/material.dart';
import 'quote.dart';
import 'package:quotes/src/constants/layout.dart';

class QuoteCard extends StatelessWidget {
  const QuoteCard({Key? key, required this.quote, required this.delete})
      : super(key: key);
  final Quote quote;
  final Function delete;
  final style =
      const TextStyle(fontWeight: FontWeight.bold, fontSize: Sizes.p20);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[300],
      elevation: 5.0,
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Padding(
        padding: const EdgeInsets.all(Sizes.p12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '"',
                  style: TextStyle(
                      fontSize: Sizes.p26,
                      fontWeight: FontWeight.bold,
                      color: BackgroundColors.main),
                ),
                Text(
                  quote.character,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Sizes.p20,
                      fontFamily: "Quicksand"),
                ),
                const Text(
                  '"',
                  style: TextStyle(
                      fontSize: Sizes.p26,
                      fontWeight: FontWeight.bold,
                      color: BackgroundColors.main),
                )
              ],
            ),
            gapH4,
            Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 2),
              child: Text(
                quote.quoteText,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                    fontSize: Sizes.p20,
                    fontFamily: "Quicksand",
                    fontWeight: FontWeight.w500),
              ),
            ),
            gapH4,
            Container(
              alignment: Alignment.bottomRight,
              child: Text(
                "- ${quote.anime}",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Sizes.p16,
                    fontFamily: "Quicksand"),
              ),
            ),
            gapH4,
            ElevatedButton.icon(
              onPressed: () {
                delete();
              },
              icon: const Icon(
                Icons.delete,
                size: Sizes.p20,
              ),
              label: const Text(
                'Delete Quote',
                style: TextStyle(fontSize: Sizes.p26, fontFamily: Fonts.main),
              ),
              style: ElevatedButton.styleFrom(primary: BackgroundColors.main),
            ),
          ],
        ),
      ),
    );
  }
}
