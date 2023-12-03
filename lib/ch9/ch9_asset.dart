import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<String> useRootBundle() {
    return rootBundle.loadString('assets/text/dva.txt');
  }

  Future<String> useDefaultAssetBundle(BuildContext context) {
    return DefaultAssetBundle.of(context).loadString('assets/text/dva.txt');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('LoadingAssets'),
        ),
        body: Column(
          children: [
            Image.asset('images/val.jpg'),
            FutureBuilder(
              future: useRootBundle(),
              builder: (context, snapshot) {
                return Text('useRootBundle() -> ${snapshot.data}', textAlign: TextAlign.left);
              }
            ),
            FutureBuilder(
              future: useDefaultAssetBundle(context),
              builder: (context, snapshot) {
                return Text('useDefaultAssetBundle() -> ${snapshot.data}', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  color: Colors.red,
                  fontSize: 20,
                  height: 2,
                  backgroundColor: Colors.amber,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.black38,
                  decorationStyle: TextDecorationStyle.wavy,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,);
              }
            )
          ]
        )
      )
    );
  }
}