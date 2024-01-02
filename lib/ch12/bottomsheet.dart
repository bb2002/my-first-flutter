import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  onBottomSheetClicked(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SafeArea(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text('추가'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.remove),
              title: const Text('삭제'),
              onTap: () {
                Navigator.of(context).pop();
              },
            )
          ]));
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Builder(builder: (BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            title: const Text('Bottom Sheet'),
          ),
          body: Column(
            children: [
              Column(children: [
                TextButton(
                    onPressed: () {
                      onBottomSheetClicked(context);
                    },
                    child: const Text('BOTTOM SHEET'))
              ])
            ],
          ));
    }));
  }
}
