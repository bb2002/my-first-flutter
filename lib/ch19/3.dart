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
            appBar: AppBar(title: Text('MultiProvider')),
            body: MultiProvider(providers: [
              Provider<int>.value(value: 10),
              Provider<String>.value(value: 'Hello'),
              ChangeNotifierProvider<Counter>.value(value: Counter())
            ], child: SubWidget())));
  }
}

class SubWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var counter = Provider.of<Counter>(context);
    var idata = Provider.of<int>(context);
    var sdata = Provider.of<String>(context);

    return Container(
        color: Colors.orange,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
            Text('IDATA: $idata'),
            Text('SDATA: $sdata')
          ],
        )));
  }
}
