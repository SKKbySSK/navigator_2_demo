import 'package:flutter/material.dart';
import 'package:navigator_2_demo/mixed/second_page.dart';
import 'package:navigator_2_demo/mixed/first_page.dart';
import 'package:navigator_2_demo/mixed/router/my_route_config.dart';

class MyRouterDelegate extends RouterDelegate<MyRouteConfig>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<MyRouteConfig> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  var _currentConfig = MyRouteConfig.firstPage;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          child: FirstPage(
            pushSecondPage: () {
              _setConfig(MyRouteConfig.secondPage);
            },
          ),
        ),
        if (_currentConfig == MyRouteConfig.secondPage)
          MaterialPage(
            child: SecondPage(
              popPage: () {
                _setConfig(MyRouteConfig.firstPage);
              },
            ),
          ),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        _setConfig(MyRouteConfig.firstPage);

        return true;
      },
    );
  }

  void _setConfig(MyRouteConfig config) {
    _currentConfig = config;
    notifyListeners();
  }

  @override
  Future<void> setNewRoutePath(MyRouteConfig configuration) async {
    _currentConfig = configuration;
  }

  @override
  MyRouteConfig? get currentConfiguration => _currentConfig;

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;
}
