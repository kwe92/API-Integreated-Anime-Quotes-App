import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quotes/src/features/quotepage/presentation/quotes_screen/quote_screen.dart';

void main() {
  return runApp(
    const ProviderScope(
      child: MaterialApp(
        home: QuotesApp(),
      ),
    ),
  );
}
