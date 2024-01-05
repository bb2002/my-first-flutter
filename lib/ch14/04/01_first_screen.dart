import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('First Screen')),
        body: Container(
            color: Colors.red,
            child: const Center(
                child: Column(children: [
              Text('FirstScreen!',
                  style: TextStyle(color: Colors.white, fontSize: 25)),
            ]))));
  }
}
