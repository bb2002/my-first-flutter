import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

const cities = [
  '춘천시',
  '원주시',
  '가평군',
  '서울시',
  '수원시',
  '안산시',
  '아틀라스시티',
  '강릉시',
  '삼척시',
  '춘천시',
  '원주시',
  '가평군',
  '서울시',
  '수원시',
  '안산시',
  '아틀라스시티',
  '강릉시',
  '삼척시',
  '춘천시',
  '원주시',
  '가평군',
  '서울시',
  '수원시',
  '안산시',
  '아틀라스시티',
  '강릉시',
  '삼척시',
  '춘천시',
  '원주시',
  '가평군',
  '서울시',
  '수원시',
  '안산시',
  '아틀라스시티',
  '강릉시',
  '삼척시',
  '춘천시',
  '원주시',
  '가평군',
  '서울시',
  '수원시',
  '안산시',
  '아틀라스시티',
  '강릉시',
  '삼척시',
  '춘천시',
  '원주시',
  '가평군',
  '서울시',
  '수원시',
  '안산시',
  '아틀라스시티',
  '강릉시',
  '삼척시',
  '춘천시',
  '원주시',
  '가평군',
  '서울시',
  '수원시',
  '안산시',
  '아틀라스시티',
  '강릉시',
  '삼척시',
  '춘천시',
  '원주시',
  '가평군',
  '서울시',
  '수원시',
  '안산시',
  '아틀라스시티',
  '강릉시',
  '삼척시',
  '춘천시',
  '원주시',
  '가평군',
  '서울시',
  '수원시',
  '안산시',
  '아틀라스시티',
  '강릉시',
  '삼척시',
  '춘천시',
  '원주시',
  '가평군',
  '서울시',
  '수원시',
  '안산시',
  '아틀라스시티',
  '강릉시',
  '삼척시'
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('ListView')),
            body: ListView.builder(
              itemCount: cities.length,
              itemBuilder: (context, index) {
                print(cities[index]);
                return Container(
                    padding: EdgeInsets.only(left: 10, top: 10),
                    height: 100,
                    child: Text(cities[index]));
              },
            )));
  }
}
