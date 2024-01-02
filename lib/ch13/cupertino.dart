import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget platformUI() {
    if (Platform.isIOS) {
      return CupertinoApp(
          debugShowCheckedModeBanner: false,
          home: CupertinoPageScaffold(
              navigationBar: const CupertinoNavigationBar(
                middle: Text('니 아이폰쓰니'),
              ),
              child: SafeArea(
                  child: ListView(children: [
                Text('isIOS: ${Platform.isIOS}'),
                Text('isAndroid: ${Platform.isAndroid}'),
              ]))));
    } else {
      return MaterialApp(
          home: Scaffold(
              appBar: AppBar(
                title: const Text('니 안드 쓰니'),
              ),
              body: SafeArea(
                child: ListView(children: [
                  Text('isIOS: ${Platform.isIOS}'),
                  Text('isAndroid: ${Platform.isAndroid}'),
                ]),
              )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return platformUI();
  }
}
