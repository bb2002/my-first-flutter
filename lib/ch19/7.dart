import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyDataModel with ChangeNotifier {
  int data1 = 10;
  int data2 = 20;

  void change1() {
    data1++;
    notifyListeners();
  }

  void change2() {
    data2++;
    notifyListeners();
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('Selector Text')),
            body: MultiProvider(providers: [
              ChangeNotifierProvider<MyDataModel>.value(value: MyDataModel()),
            ], child: HomeWidget())));
  }
}

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<MyDataModel>(
              builder: (context, model, child) {
                print('Container()');
                return Container(
                    color: Colors.green,
                    padding: EdgeInsets.all(20),
                    child: Center(
                      child: Text(
                          'Consumer, data1: ${model.data1}, data2: ${model.data2}',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ));
              },
            ),
            Selector<MyDataModel, int>(
                builder: (context, data, child) {
                  print('Selector()');
                  return Container(
                      color: Colors.cyan,
                      padding: EdgeInsets.all(20),
                      child: Center(
                        child: Text('Selector, data: ${data}',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ));
                },
                selector: (context, model) => model.data2),
            ElevatedButton(
                onPressed: () {
                  var model = Provider.of<MyDataModel>(context, listen: false);
                  model.change1();
                },
                child: Text('CHANGE1()')),
            ElevatedButton(
                onPressed: () {
                  var model = Provider.of<MyDataModel>(context, listen: false);
                  model.change2();
                },
                child: Text('CHANGE2()')),
          ],
        )));
  }
}
