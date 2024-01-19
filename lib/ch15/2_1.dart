import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp();
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  String result = '';

  onPressGet() async {
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };
    http.Response res = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/todos/1'),
        headers: headers);
  }

  onPressPost() async {
    try {
      http.Response res = await http.post(
        Uri.parse('https://jsonplaceholder.typicode.com/todos/1'),
        body: {'title': 'hello', 'body': 'world', 'userId': 1}
      );
      print('POST RESULT: ${res.statusCode}');

      if (res.statusCode == 200 || res.statusCode == 201) {
        setState(() {
          result = res.body;
        });
      } else {
        print('POST FAILED ㅠㅠ');
      }
    } catch (ex) {
      print('POST FAILED WITH ERROR $ex');
    }
  }

  onPressClient() async {
    var client = http.Client();
    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Accept": "application/json",
    };

    try {
      http.Response res = await client.post(
          Uri.parse('https://jsonplaceholder.typicode.com/todos/1'),
          body: {'title': 'hello', 'body': 'world', 'userId': 1}
      );
      if (res.statusCode == 200 || res.statusCode == 201) {
        res = await http.get(
            Uri.parse('https://jsonplaceholder.typicode.com/todos/1'),
            headers: headers);

        setState(() {
          result = res.body;
        });
      }
    } finally {
      client.close();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Http')),
        body: Center(
          child: Column(
            children: [
              Text('RESULT: $result'),
              ElevatedButton(onPressed: onPressGet, child: Text('Get')),
              ElevatedButton(onPressed: onPressPost, child: Text('Post')),
              ElevatedButton(onPressed: onPressClient, child: Text('Client')),
            ]
          )
        )
      )
    )
  }
}
