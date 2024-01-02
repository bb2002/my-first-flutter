import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: const Text('DO IT!!!')),
      body: TestScreen(),
    ));
  }
}

class TestScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  DateTime dateValue = DateTime.now();
  TimeOfDay timeValue = TimeOfDay.now();

  _dialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Dialog Title'),
            content: Column(mainAxisSize: MainAxisSize.min, children: [
              const TextField(
                  decoration: InputDecoration(border: OutlineInputBorder())),
              Row(children: [
                Checkbox(
                  value: true,
                  onChanged: (bool? value) {},
                ),
                const Text('수신동의')
              ])
            ]),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'))
            ],
          );
        });
  }

  _bottomSheet() {
    showBottomSheet(
        context: context,
        backgroundColor: Colors.yellow,
        builder: (BuildContext context) {
          return Column(mainAxisSize: MainAxisSize.min, children: [
            ListTile(
                leading: const Icon(Icons.add),
                title: const Text('ADD'),
                onTap: () {
                  Navigator.of(context).pop();
                }),
            ListTile(
                leading: const Icon(Icons.remove),
                title: const Text('REMOVE'),
                onTap: () {
                  Navigator.of(context).pop();
                })
          ]);
        });
  }

  _modalBottomStreet() {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.yellow,
        builder: (BuildContext context) {
          return SafeArea(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
            ListTile(
                leading: const Icon(Icons.add),
                title: const Text('ADD'),
                onTap: () {
                  Navigator.of(context).pop();
                }),
            ListTile(
                leading: const Icon(Icons.remove),
                title: const Text('REMOVE'),
                onTap: () {
                  Navigator.of(context).pop();
                })
          ]));
        });
  }

  Future datePicker() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2023),
        lastDate: DateTime(2099));
    if (picked != null) {
      setState(() {
        dateValue = picked;
      });
    }
  }

  Future timePicker() async {
    TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (picked != null) {
      setState(() {
        timeValue = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      ElevatedButton(onPressed: _dialog, child: const Text('DIALOG')),
      ElevatedButton(
          onPressed: _bottomSheet, child: const Text('BOTTOM SHEET')),
      ElevatedButton(
          onPressed: _modalBottomStreet,
          child: const Text('MODAL BOTTOM SHEET')),
      ElevatedButton(onPressed: datePicker, child: const Text('DATE PICKER')),
      Text('SELECTED DATE: $dateValue'),
      ElevatedButton(onPressed: timePicker, child: const Text('TIME PICKER')),
      Text('SELECTED TIME: $timeValue'),
    ]));
  }
}
