import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  void listenTest() {
    var stream = Stream.fromIterable([1, 2, 3, 4, 5, 6, 7, 8, 9]);
    StreamSubscription<int> subscription = stream.listen(null);
    subscription.onData((data) {
      print('onData($data)');
    });
    subscription.onError((err) {
      print(err);
    });
    subscription.onDone(() {
      print('Finished!!');
    });
  }

  void controllerTest() {
    var controller = StreamController.broadcast();
    var stream1 = Stream.fromIterable([1, 2, 3, 4, 5, 6]);
    var stream2 = Stream.fromIterable(['a', 'b', 'c', 'd', 'e', 'f']);

    stream1.listen((val) => controller.add(val));
    stream2.listen((val) => controller.add(val));

    controller.stream.listen((val) => print('val: $val'));
    controller.stream.listen((val) => print('val: $val'));
  }

  void transform() {
    var stream = Stream.fromIterable([1, 2, 3, 4, 5, 6, 7, 8, 9]);
    StreamTransformer<int, dynamic> transformer =
        StreamTransformer.fromHandlers(handleData: (value, sink) {
      print('transform: $value');
      sink.add('new value $value');
    });
    stream.transform(transformer).listen((val) => print(val));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: const Text('Hello')),
            body: Column(children: [
              ElevatedButton(onPressed: listenTest, child: Text('listen')),
              ElevatedButton(
                  onPressed: controllerTest, child: Text('controller')),
              ElevatedButton(onPressed: transform, child: Text('transform')),
            ])));
  }
}
