import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Stream<int> stream() async* {
    for (int i = 0; i < 5; ++i) {
      await Future.delayed(Duration(milliseconds: 100));
      yield i * i;
    }
  }

  Future<int> future() {
    return Future.delayed(Duration(milliseconds: 500), () {
      return 100;
    });
  }

  int cal(int x) {
    print('cal x: $x');
    return x * x;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('Hello')),
            body: Center(
                child: Column(children: [
              ElevatedButton(
                child: Text('RUN 1'),
                onPressed: () async {
                  await for (int data in stream()) {
                    print(data);
                  }

                  stream().listen((value) {
                    print('listen: $value}');
                  });
                },
              ),
              ElevatedButton(
                  onPressed: () async {
                    // var stream = Stream.fromFuture(future());
                    // stream.listen((value) {
                    //   print('listen2: $value');
                    // });

                    Stream<int> stream = Stream<int>.periodic(
                            const Duration(milliseconds: 800), cal)
                        .skip(3)
                        .skipWhile((value) => value < 50)
                        .take(50)
                        .takeWhile((value) => value < 100);
                    await for (int val in stream) {
                      print('value: $val');
                    }
                  },
                  child: Text('RUN 2'))
            ]))));
  }
}
