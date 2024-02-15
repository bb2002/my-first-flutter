import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Stream<int> stream() async* {
  for (int i = 0; i < 10; ++i) {
    await Future.delayed(const Duration(seconds: 1));
    yield i * i;
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('Future Stream')),
            body: MultiProvider(providers: [
              FutureProvider<String>(
                  create: (context) => Future.delayed(
                      const Duration(seconds: 3), () => "World!"),
                  initialData: "Hello"),
              StreamProvider<int>(create: (context) => stream(), initialData: 0)
            ], child: SubWidget())));
  }
}

class SubWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var futureData = Provider.of<String>(context);
    var streamData = Provider.of<int>(context);

    return Container(
        color: Colors.orange,
        child: Center(
            child: Column(children: [
          Text('Future: $futureData',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          Text('Strea: $streamData',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ])));
  }
}
