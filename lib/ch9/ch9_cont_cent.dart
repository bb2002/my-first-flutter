import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Gradient, Center')),
        body: Container(
          height: Size.infinite.height,
          width: Size.infinite.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.red,
                Colors.orange
              ]
            )
          ),
          child: Center(
              child: Container(
                margin: EdgeInsets.all(64),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage('images/val.jpg'), fit: BoxFit.cover)
              ),
            )
          )
        )
      )
    );
  }

}