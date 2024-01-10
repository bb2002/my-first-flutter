import 'package:flutter/cupertino.dart';
import 'package:flutter_lab/ch14/03/MyRoutePath.dart';

class MyRouteInformationParser extends RouteInformationParser<MyRoutePath> {
  @override
  Future<MyRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location ?? '/');
    print('routeInformation.location -> ${routeInformation.location}');
    print('routeInformation.uri -> ${routeInformation.uri}');

    if (uri.pathSegments.length >= 2) {
      var remaining = uri.pathSegments[1];
      return MyRoutePath.detail(remaining);
    }

    return MyRoutePath.home();
  }

  @override
  RouteInformation restoreRouteInformation(MyRoutePath config) {
    print('restoreRouteInformation() id -> ${config.id}');

    if (config.id != null) {
      return RouteInformation(location: '/detail/${config.id}');
    }

    return RouteInformation(location: '/');
  }
}
