import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyDataModel1 with ChangeNotifier {
  int data = 0;

  void change() {
    data++;
    notifyListeners();
  }
}

class MyDataModel2 with ChangeNotifier {
  String data = "Hello";

  change() {
    if (data == "Hello") {
      data = "World";
    } else {
      data = "Hello";
    }
    notifyListeners();
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('Consumer')),
            body: MultiProvider(providers: [
              ChangeNotifierProvider<MyDataModel1>.value(value: MyDataModel1()),
              ChangeNotifierProvider<MyDataModel2>.value(value: MyDataModel2()),
            ], child: HomeWidget())));
  }
}

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red,
        child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Consumer2<MyDataModel1, MyDataModel2>(
              builder: (context, model1, model2, child) {
                return SubWidget1(model1, model2, child);
              },
              child: SubWidget2(1)),
          Column(children: [
            ElevatedButton(
                onPressed: () {
                  var model1 =
                      Provider.of<MyDataModel1>(context, listen: false);
                  model1.change();
                },
                child: Text('Model 1 Change()')),
            ElevatedButton(
                onPressed: () {
                  var model2 =
                      Provider.of<MyDataModel2>(context, listen: false);
                  model2.change();
                },
                child: Text('Model 2 Change()')),
          ])
        ])));
  }
}

class SubWidget1 extends StatelessWidget {
  MyDataModel1 model1;
  MyDataModel2 model2;
  Widget? child;

  SubWidget1(this.model1, this.model2, this.child);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.green,
        padding: EdgeInsets.all(20),
        child: Column(children: [
          Text('SubWidget1 ${model1.data}, ${model2.data}',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
          child!,
        ]));
  }
}

class SubWidget2 extends StatelessWidget {
  SubWidget2(int a) {
    print('SubWidget2($a) Created');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.deepPurpleAccent,
        padding: EdgeInsets.all(20),
        child: Text('SubWidget2',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white)));
  }
}
