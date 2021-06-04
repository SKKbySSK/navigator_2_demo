import 'package:flutter/material.dart';
import 'package:navigator_2_demo/new/router/my_route_config.dart';

class MyRouteInfoParser extends RouteInformationParser<MyRouteConfig> {
  @override
  Future<MyRouteConfig> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    final location = routeInformation.location;
    if (location == null) {
      return MyRouteConfig.first();
    }

    final uri = Uri.parse(location);
    if (uri.pathSegments.isNotEmpty && uri.pathSegments[0] == 'second') {
      return MyRouteConfig.second();
    }

    return MyRouteConfig.first();
  }

  @override
  RouteInformation? restoreRouteInformation(MyRouteConfig configuration) {
    switch (configuration.path) {
      case MyRoutePath.firstPage:
        return RouteInformation(location: 'first');
      case MyRoutePath.secondPage:
        return RouteInformation(location: 'second');
      default:
        return null;
    }
  }
}
