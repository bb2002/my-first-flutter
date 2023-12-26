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
            appBar: AppBar(title: const Text('Listview Separated')),
            body: ListView.separated(
                itemBuilder: itemBuilder,
                separatorBuilder: separatorBuilder,
                itemCount: cities.length)));
  }

  Widget itemBuilder(BuildContext context, int index) {
    return ListTile(
      leading: const CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage('images/val.jpg'),
      ),
      title: Text(cities[index]),
      subtitle: Text('${cities[index]}에 어서오세요'),
      trailing: const Icon(Icons.more_vert),
      onTap: () {
        print('${cities[index]}의 시민이 되었습니다. 환영합니다!');
      },
    );
  }

  Widget separatorBuilder(BuildContext context, int index) {
    if (cities[index] == '아틀라스시티') {
      return const Divider(height: 2, color: Colors.black);
    }

    return Container();
  }
}
