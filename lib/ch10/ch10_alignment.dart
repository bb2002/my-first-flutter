import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Alignment')),
        body: Stack(
          children: [
            Container(
              color: Colors.red,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 300,
                height: 300,
                color: Colors.green,
                child: Align(
                  alignment: FractionalOffset(0.5, 0.5),
                  child: Container(
                    color: Colors.blue,
                    width: 50,
                    height: 50
                  )
                ),
              )
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: 150,
                height: 150,
                color: Colors.yellow,
              )
            ),
            Align(
              alignment: const Alignment(0.25, 0.25),
              child: Container(
                color: Colors.black,
                width: 100,
                height: 100
              )
            )
          ],
        )
      )
    );
  }
}