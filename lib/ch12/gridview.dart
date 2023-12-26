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
            appBar: AppBar(title: const Text('Users')),
            body: GridView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cities.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: itemBuilder)));
  }

  Widget itemBuilder(BuildContext context, int index) {
    return Card(
        child: Column(children: [
      Text('도시: ${cities[index]}'),
      Image.asset('images/val.jpg'),
    ]));
  }
}
