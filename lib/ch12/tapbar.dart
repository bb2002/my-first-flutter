import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyApp();
}

class _MyApp extends State<MyApp> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: AppBarTheme(
          backgroundColor: Colors.orange,
          foregroundColor: Colors.green,
        )),
        home: Scaffold(
            appBar: AppBar(
                title: const Text('Tab View'),
                bottom: TabBar(controller: controller, tabs: const <Widget>[
                  Tab(text: 'ONE'),
                  Tab(text: 'TWO'),
                  Tab(text: 'THREE'),
                ])),
            body: TabBarView(controller: controller, children: const <Widget>[
              Center(
                child: Text('ONE SCREEN',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              ),
              Center(
                child: Text('TWO SCREEN',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              ),
              Center(
                child: Text('THREE SCREEN',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              )
            ])));
  }
}
