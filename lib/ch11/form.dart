import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  final _myFormKey = GlobalKey<FormState>();
  String? firstName;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: const Text('Form test')),
            body: Column(
              children: [
                Form(
                    key: _myFormKey,
                    child: Column(children: [
                      TextFormField(
                        decoration: InputDecoration(labelText: "First Name"),
                        validator: (value) {
                          if (value?.isEmpty ?? false) {
                            return '니 이름 입력하라니까??';
                          }
                          if (value != null ? value.length < 2 : false) {
                            return '너무 짧다??';
                          }

                          return null;
                        },
                        onSaved: (String? value) {
                          firstName = value;
                        },
                      ),
                      ElevatedButton(
                          onPressed: () {
                            if (_myFormKey.currentState?.validate() ?? false) {
                              setState(() {
                                _myFormKey.currentState?.save();
                              });
                            }
                          },
                          child: Text('저장'))
                    ])),
                Text('name: $firstName 님')
              ],
            )));
  }
}
