import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Second Screen')),
        body: Container(
            color: Colors.cyan,
            child: const Center(
                child: Column(children: [
              Text('SecondScreen!',
                  style: TextStyle(color: Colors.white, fontSize: 25)),
            ]))));
  }
}
