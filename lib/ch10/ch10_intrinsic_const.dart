import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text("Intric And Const")),
            body: Column(
              children: [
                IntrinsicWidth(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                      Container(width: 150, height: 50, color: Colors.red),
                      Container(width: 12, height: 150, color: Colors.green),
                      Container(width: 34, height: 100, color: Colors.blue)
                    ])),
                ConstrainedBox(
                    constraints:
                        const BoxConstraints.expand(width: 300, height: 50),
                    child: Container(color: Colors.yellow))
              ],
            )));
  }
}
