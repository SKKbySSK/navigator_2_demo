import 'package:flutter/material.dart';
import 'package:navigator_2_demo/mixed/router/my_route_config.dart';

class MyRouteInfoParser extends RouteInformationParser<MyRouteConfig> {
  @override
  Future<MyRouteConfig> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    final location = routeInformation.location;
    if (location == null) {
      return MyRouteConfig.firstPage;
    }

    final uri = Uri.parse(location);
    if (uri.pathSegments.isNotEmpty && uri.pathSegments[0] == 'second') {
      return MyRouteConfig.secondPage;
    }

    return MyRouteConfig.firstPage;
  }

  @override
  RouteInformation? restoreRouteInformation(MyRouteConfig configuration) {
    switch (configuration) {
      case MyRouteConfig.firstPage:
        return RouteInformation(location: 'first');
      case MyRouteConfig.secondPage:
        return RouteInformation(location: 'second');
      default:
        return null;
    }
  }
}
