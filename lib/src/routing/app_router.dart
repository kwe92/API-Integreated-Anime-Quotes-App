import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quotes/src/features/quotepage/presentation/quotes_screen/error_screen.dart';
import 'package:quotes/src/features/quotepage/presentation/quotes_screen/quote_screen.dart';

enum AppRoute {
  home,
  errorScreen,
}

final goRouter =
    GoRouter(initialLocation: '/', debugLogDiagnostics: false, routes: [
  GoRoute(
      path: '/',
      name: AppRoute.home.name,
      builder: (context, state) =>
          //key: state.pageKey,
          //fullscreenDialog: true,
          const QuotesScreen()),
  // GoRoute(
  //     path: '/errorScreen',
  //     name: AppRoute.errorScreen.name,
  //     pageBuilder: (BuildContext context, state) =>
  //         MaterialPage(child: ErrorScreen()))
]);
