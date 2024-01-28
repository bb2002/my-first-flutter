import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<int> getAData() {
    return Future.delayed(const Duration(seconds: 1), () {
      return 10;
    });
  }

  Future<int> getBData(int arg) {
    return Future.delayed(const Duration(seconds: 3), () {
      return arg * arg;
    });
  }

  Future<int> fetcher() async {
    var a = await getAData();
    var b = await getBData(a);
    return b;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('Hello')),
            body: Center(
                child: FutureBuilder(
              future: fetcher(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text('Loading success: ${snapshot.data}',
                      style: TextStyle(color: Colors.black, fontSize: 30));
                }

                return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: CircularProgressIndicator(),
                      ),
                      Text('Loading...')
                    ]);
              },
            ))));
  }
}
