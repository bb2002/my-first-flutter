import 'package:flutter/material.dart';
import 'package:flutter_lab/ch14/user.dart';

class TwoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<String, Object> args =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;

    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text('TwoScreen'),
            ),
            body: Container(
                color: Colors.green,
                child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      const Text('TwoScreen',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30)),
                      Text(
                          'arg1: ${args['arg1']}, arg2: ${args['arg2']}, arg3: ${(args['arg3'] as MyUser).name}'),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context, MyUser('Eggbot', 'Ansan'));
                          },
                          child: const Text('POP!!')),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, '/three');
                          },
                          child: const Text('REPLEACEMNET')),
                      ElevatedButton(
                          onPressed: () async {
                            final result =
                                await Navigator.pushNamed(context, '/three');
                            print(result);
                          },
                          child: const Text('GOTO THREE')),
                      Text('canPop: ${Navigator.canPop(context)}')
                    ])))));
  }
}
