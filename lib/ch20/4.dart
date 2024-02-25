import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void incr() {
    emit(state + 1);
  }

  void decr() {
    emit(state - 1);
  }

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print('CounterCubit::onChange()');
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('Cubit')),
      body: BlocProvider(
        create: (_) => CounterCubit(),
        child: MyWidget(),
      ),
    ));
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterCubit = BlocProvider.of<CounterCubit>(context);

    return BlocBuilder<CounterCubit, int>(builder: (context, state) {
      return Container(
          color: Colors.red,
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Text('VAL: $state',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                ElevatedButton(
                    onPressed: () {
                      counterCubit.incr();
                    },
                    child: const Text('INCR!')),
                ElevatedButton(
                    onPressed: () {
                      counterCubit.decr();
                    },
                    child: const Text('DECR!')),
              ])));
    });
  }
}
