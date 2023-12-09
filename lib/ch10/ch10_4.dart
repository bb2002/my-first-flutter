import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('CH10_04')),
            body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(children: [
                  Row(children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.red,
                          height: 250,
                        )),
                    Expanded(
                        flex: 2,
                        child: Container(
                          color: Colors.orange,
                          height: 250,
                        )),
                    Expanded(
                        flex: 2,
                        child: Container(
                          color: Colors.yellow,
                          height: 250,
                        )),
                  ]),
                  Container(
                      color: Colors.green,
                      height: 250,
                      child: const Row(children: [
                        const Text('하트'),
                        const Text('코멘트'),
                        const Text('보내기'),
                        const Spacer(),
                        const Text('북마크'),
                      ])),
                  Container(color: Colors.blue, height: 250)
                ]))));
  }
}
