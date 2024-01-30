import 'dart:io';
import 'dart:isolate';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

String topData = 'Hello';

myIsolate1(var arg) {
  Future.delayed(const Duration(seconds: 2), () {
    print('In myIsolate1()... $arg, $topData');
  });
}

class MyApp extends StatelessWidget {
  String classData = 'Hello';

  void myIsolate2(var arg) {
    Future.delayed(Duration(seconds: 2), () {
      print('In myIsolate2()... $arg, $topData, $classData');
    });
  }

  void myIsolate3(SendPort port) {
    Future.delayed(const Duration(seconds: 2), () {
      port.send('Hello world!');
    });
  }

  void myIsolate4(SendPort port) {
    Stream<int> stream =
        Stream<int>.periodic(const Duration(milliseconds: 100), (data) {
      return data * data;
    }).take(100);
    stream.listen((data) {
      print('Send: $data');
      port.send(data);
    });
  }

  void myIsolate5(SendPort sendPort) {
    ReceivePort recvPort = ReceivePort();
    sendPort.send({'port': recvPort.sendPort});
    recvPort.listen((message) {
      if (message == 'exit') {
        recvPort.close();
      } else {
        print(message);
        sendPort.send({'message': 'Received $message'});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: const Text('Hello')),
            body: Column(children: [
              ElevatedButton(
                  onPressed: () {
                    print('onPressed() start, before:::: $topData, $classData');
                    Isolate.spawn(myIsolate1, 10);
                    Isolate.spawn(myIsolate2, 20);

                    topData = 'Goodbye';
                    classData = 'Goodbye';
                    print('onPressed() end, before:::: $topData, $classData');
                  },
                  child: const Text('Start Isolate')),
              ElevatedButton(
                  onPressed: () async {
                    ReceivePort port = ReceivePort();
                    print(1);
                    await Isolate.spawn(myIsolate3, port.sendPort);
                    print(2);
                    String data = await port.first;
                    print(3);
                    print('Data: $data');
                  },
                  child: const Text('Start Port')),
              ElevatedButton(
                  onPressed: () async {
                    ReceivePort port = ReceivePort();
                    Isolate isolate =
                        await Isolate.spawn(myIsolate4, port.sendPort);
                    port.listen((data) {
                      print('Receive: $data');
                      if (data > 50) {
                        port.close();
                        isolate.kill(priority: Isolate.immediate);
                      }
                    });
                  },
                  child: const Text('Start Listen')),
              ElevatedButton(
                  onPressed: () async {
                    ReceivePort port = ReceivePort();
                    await Isolate.spawn(myIsolate5, port.sendPort);
                    SendPort? sendPort = null;
                    port.listen((message) {
                      if (message['port'] != null) {
                        print('message[port] received');
                        sendPort = message['port'];
                        sendPort?.send('Hello world');
                      } else {
                        print(message['message']);
                      }
                    });
                  },
                  child: const Text('Start Port')),
              ElevatedButton(
                  onPressed: () async {
                    compute((val) {
                      int result = 0;
                      for (var i = 0; i < val; ++i) {
                        sleep(Duration(milliseconds: 100));
                        result += i;
                      }
                      return result;
                    }, 10)
                        .then((data) => print('compute: $data'));
                  },
                  child: const Text('Start Compute')),
            ])));
  }
}
