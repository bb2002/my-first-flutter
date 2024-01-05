import 'package:flutter/material.dart';

import '01_first_screen.dart';
import '02_second_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool _isDeepLink = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Navigation 2.0 Test',
        home: Navigator(
          pages: [
            MaterialPage(child: FirstScreen()),
            if (_isDeepLink) MaterialPage(child: SecondScreen())
          ],
          onPopPage: (route, result) => route.didPop(result),
        ));
  }
}
