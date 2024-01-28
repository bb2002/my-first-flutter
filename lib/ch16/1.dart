import "dart:async";
import "dart:convert";
import "package:flutter/material.dart";
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<String> getTodo(int id) async {
    // print('1111');
    // http.Response res = await http.get(
    //     Uri.parse('https://jsonplaceholder.typicode.com/todos/$id'),
    //     headers: {
    //       "Content-Type": "application/json",
    //       "Accept": "application/json",
    //     });
    // print('2222');
    //
    // if (res.statusCode == 200) {
    //   print(res.body);
    //   Map<String, dynamic> body = jsonDecode(res.body);
    //   return body['title'];
    // }
    // print('3333');

    return 'Unknown';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('Test')),
            body: FutureBuilder(
                future: getTodo(1),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Center(child: Text('title: ${snapshot.data}'));
                  }

                  return Center(child: Text('Loading...'));
                })));
  }
}
