import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('Inherited')),
      body: MyInheritedWidget(MyInheritedWidget(TestWidget())),
    ));
  }
}

class MyInheritedWidget extends InheritedWidget {
  int count = 0;

  MyInheritedWidget(child) : super(child: child);

  increment() {
    ++count;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static MyInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();
  }
}

class TestSubWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int count = MyInheritedWidget.of(context)?.count ?? -1;
    return Container(
        width: 200,
        height: 200,
        color: Colors.yellow,
        child: Center(
            child: Text('SubWidget: $count',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ))));
  }
}

class TestWidget extends StatelessWidget {
  TestWidget() {
    print('TestWidget() called.');
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      MyInheritedWidget? widget = MyInheritedWidget.of(context);
      int count = widget?.count ?? -1;
      Function increment = widget?.increment ?? () {};
      return Center(
          child: Container(
              color: Colors.red,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('TestWidget: $count',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    ElevatedButton(
                        onPressed: () => setState(() => increment()),
                        child: Text('INCREMENT!!')),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            ++widget?.count;
                          });
                        },
                        child: Text('widget.count++'))
                  ])));
    });
  }
}
