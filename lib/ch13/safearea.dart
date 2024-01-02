import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: const Text('SafeArea')),
      body: SafeArea(child: SingleChildScrollView(child: Column(children: (() {
        List<Widget> widgets = [];
        for (var i = 0; i < 50; ++i) {
          widgets.add(ListTile(title: Text('LISTVIEW $i')));
        }
        return widgets;
      })()))),
    ));
  }
}
