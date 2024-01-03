import 'package:flutter/material.dart';

void main() {
  runApp(RootApp());
}

class RootApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
              bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(48.0),
                  child: Theme(
                      data: ThemeData(brightness: Brightness.light),
                      child: Container(
                          height: 48.0,
                          alignment: Alignment.center,
                          child: const Text('AppBar Bottom Text')))),
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/val.jpg'),
                        fit: BoxFit.cover)),
              ),
              title: const Text('AppBar Title'),
              actions: [
                IconButton(icon: const Icon(Icons.add_alert), onPressed: () {}),
                IconButton(icon: const Icon(Icons.phone), onPressed: () {})
              ]),
          body: const Center(child: Text('Body')),
          drawer: Drawer(
              child: ListView(padding: EdgeInsets.zero, children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('드로워 헤더', style: TextStyle(color: Colors.white)),
            ),
            ListTile(title: const Text('Item 1'), onTap: () {}),
            ListTile(title: const Text('Item 2'), onTap: () {})
          ])),
          bottomNavigationBar: BottomNavigatorWidget(),
        ));
  }
}

class BottomNavigatorWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BottomNavigatorWidget();
}

class _BottomNavigatorWidget extends State<BottomNavigatorWidget> {
  int _currentIndex = 0;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home), label: '홈', backgroundColor: Colors.red),
        BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: '비지니스',
            backgroundColor: Colors.green),
        BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: '학교용',
            backgroundColor: Colors.blue),
        BottomNavigationBarItem(
            icon: Icon(Icons.phone),
            label: '문의전화',
            backgroundColor: Colors.orange),
      ],
      currentIndex: _currentIndex,
      onTap: _onTap,
    );
  }
}
