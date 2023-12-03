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
        body: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: 50,
                      height: 50,
                      color: Colors.red
                  ),
                  Container(
                      width: 50,
                      height: 50,
                      color: Colors.green
                  ),
                  Container(
                      width: 50,
                      height: 50,
                      color: Colors.blue
                  ),
                ]
              )
            ),
            Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          width: 50,
                          height: 50,
                          color: Colors.red
                      ),
                      Container(
                          width: 50,
                          height: 50,
                          color: Colors.green
                      ),
                      Container(
                          width: 50,
                          height: 50,
                          color: Colors.blue
                      ),
                    ]
                )
            ),
            Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          width: 50,
                          height: 50,
                          color: Colors.red
                      ),
                      Container(
                          width: 50,
                          height: 50,
                          color: Colors.green
                      ),
                      Container(
                          width: 50,
                          height: 50,
                          color: Colors.blue
                      ),
                    ]
                )
            )
          ],
        )
      ),
    );
  }
}