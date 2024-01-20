import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  String result = '';

  dioTest() async {
    try {
      var dio = Dio(BaseOptions(
          baseUrl: 'https://reqres.in/api/',
          connectTimeout: const Duration(milliseconds: 5000),
          receiveTimeout: const Duration(milliseconds: 5000),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.acceptHeader: 'application/json',
          }));

      List<Response<dynamic>> response = await Future.wait([
        dio.get('/users?page=1'),
        dio.get('/users?page=2'),
      ]);

      response.forEach((element) {
        if (element.statusCode == 200) {
          setState(() {
            result = '$result / ${element.data.toString()}';
          });
        }
      });
    } catch (ex) {
      print(ex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('Test')),
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  SingleChildScrollView(
                      child: Text(result), scrollDirection: Axis.vertical),
                  ElevatedButton(onPressed: dioTest, child: Text('GETGET!!'))
                ]))));
  }
}
