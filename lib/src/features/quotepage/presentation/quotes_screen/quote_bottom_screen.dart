import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quotes/src/constants/layout.dart';
import 'package:quotes/src/features/quotepage/data/anime_chan_api_client.dart';

class QuoteScreenBottomPage extends ConsumerWidget {
  QuoteScreenBottomPage({Key? key}) : super(key: key);
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context, ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        ListTile(
          title: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              label: const Text('Enter a anime...'),
              hintText: 'eg: Bleach, Naruto, One Piece...',
              border: const OutlineInputBorder(),
              suffixIcon: IconButton(
                onPressed: () {
                  controller.clear();
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
                padding: const EdgeInsets.fromLTRB(Sizes.p26, 0, Sizes.p26, 0),
                child: MaterialButton(
                  onPressed: () {
                    ref.refresh(animeQuoteListProvider(controller.text));
                    // Navigator.pushNamed(context, routeName);
                    // Navigator.pop(context);
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
      ]),
    );
  }
}
