import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainApp();
}

class _MainApp extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: MyRouterDelegate(),
      routeInformationParser: MyRouterInformationParser(),
    );
  }
}

class MyRoutePath {
  String? id;

  MyRoutePath.home() : this.id = null;
  MyRoutePath.detail(this.id);
}

class MyRouterInformationParser extends RouteInformationParser<MyRoutePath> {
  @override
  Future<MyRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location ?? '/');
    if (uri.pathSegments.length >= 2) {
      var arg = uri.pathSegments[1];
      return MyRoutePath.detail(arg);
    }

    return MyRoutePath.home();
  }

  @override
  RouteInformation restoreRouteInformation(MyRoutePath configuration) {
    if (configuration.id != null) {
      return RouteInformation(location: '/detail/${configuration.id}');
    }

    return const RouteInformation(location: '/');
  }
}

class MyRouterDelegate extends RouterDelegate<MyRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<MyRoutePath> {
  String? selectedId;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(child: HomeScreen(_onDetailButtonPressed)),
        if (selectedId != null) MaterialPage(child: DetailScreen(selectedId))
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        selectedId = null;
        notifyListeners();
        return true;
      },
    );
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => GlobalKey<NavigatorState>();

  @override
  Future<void> setNewRoutePath(MyRoutePath configuration) async {
    if (configuration.id != null) {
      selectedId = configuration.id;
    }
  }

  void _onDetailButtonPressed(String id) {
    selectedId = id;
    notifyListeners();
  }
}

class HomeScreen extends StatelessWidget {
  final ValueChanged<String> onPressed;

  HomeScreen(this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
            color: Colors.red,
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Text('Home Screen!',
                      style: TextStyle(color: Colors.white, fontSize: 30)),
                  ElevatedButton(
                      onPressed: () => onPressed('1'),
                      child: const Text('GO TO /detail/1')),
                  ElevatedButton(
                      onPressed: () => onPressed('2'),
                      child: const Text('GO TO /detail/2')),
                ]))));
  }
}

class DetailScreen extends StatelessWidget {
  String? id;

  DetailScreen(this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
            color: Colors.green,
            child: Center(
              child: Text('Detail Screen: ${this.id}',
                  style: TextStyle(color: Colors.white, fontSize: 30)),
            )));
  }
}
