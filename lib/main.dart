import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quotes/src/features/quotepage/presentation/quotes_screen/quote_screen.dart';
import 'package:quotes/src/routing/app_router.dart';

void main() {
  return runApp(
    const ProviderScope(
        child: MaterialApp(
      home: QuotesScreen(),
    )
        // MaterialApp.router(
        //   routerDelegate: goRouter.routerDelegate,
        //   routeInformationParser: goRouter.routeInformationParser,
        //   routeInformationProvider: goRouter.routeInformationProvider,
        //   debugShowCheckedModeBanner: false,
        // ),
        ),
  );
}
