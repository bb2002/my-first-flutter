import 'dart:convert';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  String jsonStr = '{"id": 1, "title": "제목입니다", "completed": false}';
  Todo? todo;
  String result = '';

  onPressDecode() {
    Map<String, dynamic> map = jsonDecode(jsonStr);
    todo = Todo.fromJSON(map);
    setState(() {
      if (todo != null) {
        result =
            "[DECODE] -> ID: ${todo?.id}, TITLE: ${todo?.title}, COMPLETED: ${todo?.completed}";
      }
    });
  }

  onPressEncode() {
    setState(() {
      result = "[ENCODE] -> ${jsonEncode(todo?.toJSON())}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('JSON App')),
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Text('$result'),
                  ElevatedButton(
                      onPressed: onPressDecode, child: Text('DECODE')),
                  ElevatedButton(
                      onPressed: onPressEncode, child: Text('ENCODE')),
                ]))));
  }
}

class Todo {
  int id;
  String title;
  bool completed;

  Todo(this.id, this.title, this.completed) {}

  Todo.fromJSON(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        completed = json['completed'];

  Map<String, dynamic> toJSON() =>
      {'id': id, 'title': title, 'completed': completed};
}
