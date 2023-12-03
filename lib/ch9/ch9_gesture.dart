import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Geusture App')),
        body: Column(
          children: [
            GestureDetector(
              child: Image.asset('images/val.jpg'),
              onTap: () {
                print('onTap()!!!');
              },
              onVerticalDragStart: (DragStartDetails details) {
                print('onVerticalDragStart ${details.globalPosition.dx}, ${details.globalPosition.dy}');
              },
            ),
            ElevatedButton(onPressed: () { print('ElevatedButton::onPressed'); }, child: Text('Elevated button'), style: ButtonStyle(
              backgroundColor:MaterialStateProperty.all<Color>(Colors.amber),
            )),
            ElevatedButton(onPressed: null, child: Text('Disabled Button')),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.amber,
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage('images/val.jpg'), fit: BoxFit.cover)
              ),
            )
          ],
        )
      )
    );
  }
}