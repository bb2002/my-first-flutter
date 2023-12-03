import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stateful Widget'),
        ),
        body: MyStatefulWidget(),
      )
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyStatefulWidget();
  }
}

class _MyStatefulWidget extends State<MyStatefulWidget> {
  bool enabled = false;
  String stateText = 'Disabled';

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant MyStatefulWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {

    return Center(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: (enabled ? Icon(Icons.check_box, size: 20) : Icon(Icons.check_box_outline_blank, size: 20)),
                color: Colors.red,
                onPressed: changeCheck,
              ),
              Container(
                  padding: EdgeInsets.only(left: 16),
                  child: Text('$stateText', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold))
              )
            ]
        )
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  void changeCheck() {
    setState(() {
      if (enabled) {
        enabled = false;
        stateText = 'Disabled';
      } else {
        enabled = true;
        stateText = 'Enabled';
      }
    });

  }
}