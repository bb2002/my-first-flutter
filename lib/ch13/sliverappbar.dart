import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  List<Widget> getWidgets() {
    List<Widget> widgets = [];
    for (var i = 0; i < 100; ++i) {
      widgets.add(ListTile(title: Text('Hello World Item $i')));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: CustomScrollView(
          slivers: [
            SliverAppBar(
                // leading: IconButton(
                //     icon: const Icon(Icons.expand), onPressed: () {}),
                expandedHeight: 100,
                floating: true, // 위로 스크롤 시작하면 바로 뜸
                pinned: true, // 최소한 한 줄을 표시됨
                snap: false, // floating=true 일때, 앱바가 다시 나올 때 한번에 나오게 할지 여부
                elevation: 10,
                backgroundColor: Colors.pink,
                flexibleSpace: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('images/val.jpg'),
                    fit: BoxFit.cover,
                  )),
                ),
                title: const Text('AppBar Title'),
                actions: [
                  IconButton(
                      icon: const Icon(Icons.add_alert), onPressed: () {}),
                  IconButton(icon: const Icon(Icons.phone), onPressed: () {})
                ]),
            SliverFixedExtentList(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return ListTile(title: Text('Hello World Item $index'));
                }, childCount: 50),
                itemExtent: 70.0)
          ],
        )));
  }
}
