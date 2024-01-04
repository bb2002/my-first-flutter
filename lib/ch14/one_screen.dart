import 'package:flutter/material.dart';
import 'package:flutter_lab/ch14/user.dart';

class OneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('OneScreen'),
            ),
            body: Container(
                color: Colors.red,
                child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      const Text('OneScreen',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30)),
                      ElevatedButton(
                          onPressed: () async {
                            final result = await Navigator.pushNamed(
                                context, '/two', arguments: {
                              'arg1': 'Hello',
                              'arg2': 123456,
                              'arg3': MyUser('Ballbot', 'Chunchone')
                            });
                            print((result as MyUser).name);
                          },
                          child: const Text('GOTO TWO')),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/two',
                                arguments: 'fake');
                          },
                          child: const Text('GOTO FAKE TWO')),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.maybePop(context);
                          },
                          child: Text('POP')),
                      Text('canPop: ${Navigator.canPop(context)}')
                    ])))));
  }
}
