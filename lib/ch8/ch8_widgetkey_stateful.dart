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
    MyRedItemWidget(),
    MyBlueItemWidget()
  ];

  onPressed() {
    setState(() {
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
            ElevatedButton(onPressed: onPressed, child: Text('두 위치를 바꾼다!!!'))
          ],
        )
      ),
    );
  }
}

class MyRedItemWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyRedItemWidget(Colors.red);
  }
}

class _MyRedItemWidget extends State<StatefulWidget> {
  Color color;
  _MyRedItemWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: color,
        width: 150,
        height: 150,
      )
    );
  }
}

class MyBlueItemWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyBlueItemWidgetState(Colors.blue);
  }
}

class _MyBlueItemWidgetState extends State<StatefulWidget> {
  Color color;
  _MyBlueItemWidgetState(this.color);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: color,
        width: 150,
        height: 150,
      )
    );
  }
}