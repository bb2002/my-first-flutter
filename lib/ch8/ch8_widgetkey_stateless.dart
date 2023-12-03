import 'package:flutter/material.dart';

void main() {
  runApp(MyListWidget());
}

class MyListWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyListWidgetState();
  }
}

class _MyListWidgetState extends State<MyListWidget> {
  List<Widget> widgetList = [
    MyColorItemWidget(Colors.red),
    MyColorItemWidget(Colors.blue),
  ];

  onPressed() {
    setState(() {
      // Swap Widget
      widgetList.insert(1, widgetList.removeAt(0));
    });
  }

  @override
  Widget build(BuildContext context) {
    print('widgetList.length: ${widgetList.length}');
    return MaterialApp(
        home: Scaffold(
        appBar: AppBar(title: Text('Key Test')),
        body: Column(
          children: [
            Row(children: widgetList,),
            ElevatedButton(onPressed: onPressed, child: Text('두 위치를 바꾼다!!!!'))
          ]
        )
      )
    );
  }}

class MyColorItemWidget extends StatelessWidget {
  Color color;
  MyColorItemWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Container(
      color: color,
      width: 150,
      height: 150
    ));
  }
}