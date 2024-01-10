import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final bool _isDeepLink = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Navigator 2.0 Test',
        home: Navigator(pages: [
          MaterialPage(child: OneScreen()),
          if (_isDeepLink) MaterialPage(child: TwoScreen())
        ], onPopPage: (route, result) => route.didPop(result)));
  }
}

class OneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('One Screen'),
        ),
        body: Container(
            color: Colors.red,
            child: const Center(
                child: Column(children: [
              Text('One Screen!!',
                  style: TextStyle(fontSize: 20, color: Colors.white))
            ]))));
  }
}

class TwoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Two Screen'),
        ),
        body: Container(
            color: Colors.blue,
            child: const Center(
                child: Column(children: [
              Text('Two Screen!!',
                  style: TextStyle(fontSize: 20, color: Colors.white))
            ]))));
  }
}
