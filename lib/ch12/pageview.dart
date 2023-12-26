import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  PageController controller =
      PageController(initialPage: 1, viewportFraction: 0.8);

  onTap(BuildContext context, String color) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
              title: const Text('Dialog Title'),
              content: Text('Selected color: $color'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('닫기'))
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Builder(
      builder: (BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: Text('PageView Alert')),
            body: PageView(controller: controller, children: [
              GestureDetector(
                  onTap: () {
                    onTap(context, 'RED');
                  },
                  child: Container(
                      margin: const EdgeInsets.all(20),
                      color: Colors.red,
                      child: const Center(child: Text('RED PAGE!!!')))),
              GestureDetector(
                  onTap: () {
                    onTap(context, 'GREEN');
                  },
                  child: Container(
                      margin: EdgeInsets.all(20),
                      color: Colors.green,
                      child: const Center(child: Text('GREEN PAGE!!!')))),
              GestureDetector(
                  onTap: () {
                    onTap(context, 'BLUE');
                  },
                  child: Container(
                      margin: const EdgeInsets.all(20),
                      color: Colors.blue,
                      child: const Center(child: Text('BLUE PAGE!!!'))))
            ]));
      },
    ));
  }
}
