import 'dart:isolate';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String topData = "Hello";

  void myIsolate(var args) {
    Future.delayed(Duration(seconds: 3), () {
      print('myIsolate end. $args, topData: $topData');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: const Text('Hello')),
            body: Column(children: [
              ElevatedButton(
                  onPressed: () {
                    Isolate.spawn(myIsolate, 10);
                  },
                  child: const Text('Start Isolate')),
            ])));
  }
}
