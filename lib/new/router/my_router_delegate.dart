import 'package:flutter/material.dart';
import 'package:navigator_2_demo/new/second_page.dart';
import 'package:navigator_2_demo/new/first_page.dart';
import 'package:navigator_2_demo/new/router/my_route_config.dart';

class MyRouterDelegate extends RouterDelegate<MyRouteConfig>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<MyRouteConfig> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  var _path = MyRoutePath.firstPage;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          child: FirstPage(
            pushSecondPage: () {
              _path = MyRoutePath.secondPage;
              notifyListeners();
            },
          ),
        ),
        if (_path == MyRoutePath.secondPage)
          MaterialPage(
            child: SecondPage(
              popPage: () {
                _path = MyRoutePath.firstPage;
                notifyListeners();
              },
            ),
          ),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        _path = MyRoutePath.firstPage;
        notifyListeners();

        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(MyRouteConfig configuration) async {
    _path = configuration.path;
  }

  @override
  MyRouteConfig? get currentConfiguration {
    switch (_path) {
      case MyRoutePath.firstPage:
        return MyRouteConfig.first();
      case MyRoutePath.secondPage:
        return MyRouteConfig.second();
    }
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;
}
