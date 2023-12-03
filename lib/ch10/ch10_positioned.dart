import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Positioned")),
        body: Stack(
          children: [
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.blue,
              width: 300,
              height: 300,
            ),
            Positioned(child: Container(
              color: Colors.pink,
              height: 150,
              width: 150
            ),
            right: 40,
            top: 40)
          ]
        )
      )
    );
  }
}