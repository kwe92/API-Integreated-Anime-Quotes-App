import 'package:flutter/material.dart';
import 'package:quotes/src/constants/layout.dart';
import 'package:quotes/src/common_widgets/base_layout.dart';
import 'package:quotes/src/features/quotepage/presentation/quotes_screen/quote_screen.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key, required this.error});
  final Object error;
  @override
  Widget build(BuildContext context) {
    return ScreenLayout(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(Sizes.p12, 0, Sizes.p12, 0),
            child: Text(
              error.toString(),
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: Sizes.p20,
                  fontFamily: Fonts.secondary),
            ),
          ),
          const Spacer(),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.fromLTRB(Sizes.p26, 0, Sizes.p26, 0),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const QuotesScreen(),
                        ),
                      );
                    },
                    color: BackgroundColors.main,
                    child: const Text(
                      'Return',
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
    );
  }
}
