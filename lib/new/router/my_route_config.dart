enum MyRoutePath {
  firstPage,
  secondPage,
}

class MyRouteConfig {
  const MyRouteConfig.first() : path = MyRoutePath.firstPage;
  const MyRouteConfig.second() : path = MyRoutePath.secondPage;

  final MyRoutePath path;
}
