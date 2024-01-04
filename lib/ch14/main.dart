import 'package:flutter/material.dart';
import 'package:flutter_lab/ch14/three_screen.dart';
import 'package:flutter_lab/ch14/two_screen.dart';

import 'one_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/one',
        // onGenerateRoute: (settings) {
        //   if (settings.name == '/two') {
        //     final args = settings.arguments;
        //     if (args is String) {
        //       if (args == 'fake') {
        //         return MaterialPageRoute(builder: (context) => ThreeScreen());
        //       }
        //     }
        //     return MaterialPageRoute(builder: (context) => TwoScreen());
        //   }
        // },
        routes: {
          '/one': (context) => OneScreen(),
          '/two': (context) => TwoScreen(),
          '/three': (context) => ThreeScreen(),
        });
  }
}
