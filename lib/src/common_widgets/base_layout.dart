import 'package:flutter/material.dart';
import 'package:quotes/src/constants/layout.dart';

class ScreenLayout extends StatelessWidget {
  const ScreenLayout({super.key, required this.body});
  final Widget body;
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
        body: body,
      ),
    );
  }
}
