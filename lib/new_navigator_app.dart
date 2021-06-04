import 'package:flutter/material.dart';
import 'package:navigator_2_demo/new/router/my_route_info_parser.dart';
import 'package:navigator_2_demo/new/router/my_router_delegate.dart';

class NewNavigatorApp extends StatelessWidget {
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
