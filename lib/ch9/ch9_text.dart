import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String longText = '언론·출판은 타인의 명예나 권리 또는 공중도덕이나 사회윤리를 침해하여서는 아니된다. 언론·출판이 타인의 명예나 권리를 침해한 때에는 피해자는 이에 대한 피해의 배상을 청구할 수 있다.';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Text test')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Hello World!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.red,
                fontSize: 20,
                height: 2,
                backgroundColor: Colors.yellow,
                decoration: TextDecoration.underline,
                decorationColor: Colors.red,
                decorationStyle: TextDecorationStyle.wavy,
              )
            ),
            Text(
              longText,
              style: TextStyle(
                fontSize: 18,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            RichText(
              text: TextSpan(
                text: 'HE',
                style: TextStyle(fontSize: 20, color: Colors.black),
                children: [
                  TextSpan(text: 'L', style: TextStyle(fontStyle: FontStyle.italic), children: [
                    TextSpan(text: 'LO'),
                    TextSpan(text: 'WO', style: TextStyle(color: Colors.red))
                  ]),
                  TextSpan(text: 'RLD', style: TextStyle(fontWeight: FontWeight.bold))
                ],
              )
            ),
            Container(
              color: Colors.red,
              child: Image.asset('images/val.jpg', height: 150, width: 150)
            )

          ]
        )
      )
    );
  }
}