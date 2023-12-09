import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: const Text("Expended")),
            body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Container(color: Colors.red, width: 100, height: 350),
                        Container(color: Colors.green, width: 100, height: 350),
                        Container(color: Colors.blue, width: 100, height: 350)
                      ],
                    )))));
  }
}
