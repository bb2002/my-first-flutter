import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Counter with ChangeNotifier {
  int _count = 0;
  int get count => _count;

  void incr() {
    _count++;
    notifyListeners();
  }
}

class Sum {
  int _sum = 0;
  int get sum => _sum;

  void set sum(val) {
    _sum = 0;

    for (int i = 0; i < val; ++i) {
      _sum += i;
    }
  }

  Sum(Counter counter) {
    sum = counter.count;
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('ProxyProvider')),
            body: MultiProvider(providers: [
              ChangeNotifierProvider<Counter>.value(value: Counter()),
              ProxyProvider<Counter, Sum>(update: (context, model, sum) {
                if (sum == null) {
                  return Sum(model);
                }

                sum.sum = model.count;
                return sum;
              }),
              ProxyProvider2<Counter, Sum, String>(
                update: (context, counter, sum, data) {
                  return "cnt: ${counter.count}, sum: ${sum.sum}";
                },
              )
            ], child: SubWidget())));
  }
}

class SubWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var counter = Provider.of<Counter>(context);
    var sum = Provider.of<Sum>(context);
    var sdata = Provider.of<String>(context);

    return Container(
        color: Colors.orange,
        child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('count: ${counter.count}',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          Text('sum: ${sum.sum}',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          Text('string: $sdata',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          ElevatedButton(
              onPressed: () {
                counter.incr();
              },
              child: Text('INCR!!')),
        ])));
  }
}
