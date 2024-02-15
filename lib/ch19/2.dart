import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter with ChangeNotifier {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('ChangeNotifier')),
      body: ChangeNotifierProvider<Counter>.value(
          value: Counter(), child: SubWidget()),
    ));
  }
}

class SubWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);

    return Container(
        color: Colors.orange,
        child: Center(
          child: Column(children: [
            Text('Provider Count: ${counter.count}',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white)),
            ElevatedButton(
                onPressed: () {
                  counter.increment();
                },
                child: Text('INCR!!')),
          ]),
        ));
  }
}
