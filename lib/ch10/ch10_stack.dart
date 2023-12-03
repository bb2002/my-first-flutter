import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Row and column')),
        body: IndexedStack(
          index: 1,
          children: [
            Container(
              color: Colors.red
            ),
            Container(
              color: Colors.green,
              width: 300,
              height: 300,
            ),
            Container(
              color: Colors.blue,
              width: 150,
              height: 150,
            )
          ]
        )
      ),
    );
  }
}