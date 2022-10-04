import 'package:flutter/material.dart';
import '../../domain/quote.dart';
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
                      fontFamily: Fonts.quicksand),
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
                    fontFamily: Fonts.quicksand,
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
                    fontFamily: Fonts.quicksand),
              ),
            ),
            gapH4,
            // Center(
            //   child: ClipRRect(
            //     borderRadius: BorderRadius.circular(5),
            //     child: Stack(
            //       children: [
            //         Positioned.fill(
            //           child: Container(
            //             decoration: const BoxDecoration(
            //               gradient: LinearGradient(
            //                 colors: <Color>[
            //                   Color.fromRGBO(121, 172, 179, 1),
            //                   Color.fromARGB(255, 129, 182, 189),
            //                   Color.fromARGB(255, 161, 214, 221)
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ),
            //         IntrinsicHeight(
            //           child: Row(
            //             children: [
            //               TextButton(
            //                 style: TextButton.styleFrom(
            //                     //padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
            //                     primary: Colors.white,
            //                     textStyle: const TextStyle(
            //                       fontSize: 20,
            //                     )),
            //                 onPressed: () {
            //                   delete();
            //                 },
            //                 child: const Text("Delete Quote"),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // )

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
                style: TextStyle(fontSize: Sizes.p30, fontFamily: Fonts.main),
              ),
              style: ElevatedButton.styleFrom(primary: BackgroundColors.main),
            ),
          ],
        ),
      ),
    );
  }
}
