import 'package:flutter/material.dart';

class ThreeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('ThreeScreen'),
            ),
            body: Container(
                color: Colors.blue,
                child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      const Text('ThreeScreen',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30)),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context, 'Goodbye');
                          },
                          child: const Text('POP!!'))
                    ])))));
  }
}
