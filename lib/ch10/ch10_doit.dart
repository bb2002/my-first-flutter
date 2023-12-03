import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text('DOIT')),
          body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.yellow,
                margin: EdgeInsets.only(bottom: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.red,
                      width: 50,
                      height: 100,
                    ),
                    Container(
                      color: Colors.green,
                      width: 50,
                      height: 50,
                    ),
                    Container(
                      color: Colors.blue,
                      width: 50,
                      height: 150,
                    )
                  ]
                )
              ),
              Container(
                  color: Colors.yellow,
                  margin: EdgeInsets.only(bottom: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        color: Colors.red,
                        width: 50,
                        height: 100,
                      ),
                      Container(
                        color: Colors.green,
                        width: 50,
                        height: 50,
                      ),
                      Container(
                        color: Colors.blue,
                        width: 50,
                        height: 150,
                      )
                    ]
                  )
              ),
              Container(
                color: Colors.yellow,
                height: 120,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        color: Colors.red,
                        width: 50,
                        height: 100,
                      ),
                      Container(
                        color: Colors.green,
                        width: 50,
                        height: 50,
                      ),
                      Container(
                        color: Colors.blue,
                        width: 50,
                        height: 150,
                      )
                    ]
                  )
              ),
              Container(
                height: 200,
                child: Stack(
                    children: [
                      Container(
                          color: Colors.red
                      ),
                      Container(
                        color: Colors.green,
                        width: 100,
                        height: 100,
                      ),
                      Container(
                        color: Colors.yellow,
                        width: 50,
                        height: 50,
                      ),
                    ]
                )
              )

            ]
          )
        )
      ),
    );
  }
}