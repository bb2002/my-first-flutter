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
            body: Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.red,
                      width: 12,
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                        color: Colors.green, width: 12, height: 9999)),
                Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.blue,
                      width: 12,
                    )),
              ],
            )));
  }
}
