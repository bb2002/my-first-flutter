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
                Positioned(
                  left: 40,
                  top: 40,
                  child: Container(
                    width: 120,
                    height: 120,
                    color: Colors.pink,
                  )
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    color: Colors.blue,
                    width: 120,
                    height: 120,
                  )
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    color: Colors.yellow,
                    width: 120,
                    height: 120,
                  )
                )
              ]
            )
        )
    );
  }
}