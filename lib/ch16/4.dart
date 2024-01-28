import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  int data(int x) {
    return x * x;
  }

  Stream<int> stream() {
    return Stream<int>.periodic(const Duration(milliseconds: 800), data)
        .take(5);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: const Text('Hello')),
            body: StreamBuilder(
                stream: stream(),
                builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Text('Completed!!', style: TextStyle(fontSize: 25));
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 80,
                            height: 80,
                            child: CircularProgressIndicator(),
                          ),
                          Text('Waiting...', style: TextStyle(fontSize: 25))
                        ]);
                  }

                  return Text('data: ${snapshot.data}');
                })));
  }
}
