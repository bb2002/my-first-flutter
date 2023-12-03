import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  onIconClickec() {
    print('YOU CLIECKED ICON!!');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Image Test')),
        body: Column(
          children: [
            Icon(FluentIcons.clock_alarm_16_filled, size: 100, color: Colors.red),
            IconButton(
              icon: Icon(FluentIcons.app_title_20_regular, size: 100),
              onPressed: onIconClickec,
            )
          ]
        )
      )
    );
  }
}