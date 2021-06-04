import 'package:flutter/material.dart';

class ComplexNavigationApp extends StatelessWidget {
  final parser = MyRouteInfoParser();
  final delegate = MyRouterDelegate();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: parser,
      routerDelegate: delegate,
    );
  }
}
