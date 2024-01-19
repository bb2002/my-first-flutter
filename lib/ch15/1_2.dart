import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:http/http.dart' as http;

part '1_2.g.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  String jsonStr =
      '{"id": 1, "title": "제목입니다", "completed": false, "location": {"latitude": "3.141592", "longitude": "3.1415928"}}';
  String result = '';
  Todo? todo;

  onPressDecode() {
    print(todo?.toJson());
    setState(() {
      result = "[DECODE]: ${todo?.toJson()}";
    });
  }

  onPressEncode() {
    setState(() {
      result = "[ENCODE]: ${jsonEncode(todo)}";
    });
  }

  onPressRequest() async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
    http.Response res = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/todos/1'),
        headers: headers);
    setState(() {
      result = "[HTTP]: ${res.body}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('Serializable')),
            body: Center(
                child: Column(children: [
              Text('$result'),
              ElevatedButton(onPressed: onPressDecode, child: Text('DECODE')),
              ElevatedButton(onPressed: onPressEncode, child: Text('ENCODE')),
              ElevatedButton(onPressed: onPressRequest, child: Text('REQUEST')),
            ]))));
  }
}

@JsonSerializable()
class Location {
  String latitude;
  String longitude;

  Location(this.latitude, this.longitude);
  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable()
class Todo {
  @JsonKey(name: 'id')
  int todoId;
  String title;
  bool completed;
  Location location;

  Todo(this.todoId, this.title, this.completed, this.location);
  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);
  Map<String, dynamic> toJson() => _$TodoToJson(this);
}
