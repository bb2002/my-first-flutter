import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyRepository {
  func() {
    print('func() called.');
  }
}

abstract class CounterClass {}

class IncrEvent extends CounterClass {}

class DecrEvent extends CounterClass {}

class BlocCounter extends Bloc<CounterClass, int> {
  BlocCounter() : super(0) {
    on<IncrEvent>((event, emit) {
      emit(state + 1);
    });
    on<DecrEvent>((event, emit) {
      emit(state - 1);
    });
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
            appBar: AppBar(title: Text('Consumer, Repo')),
            body: RepositoryProvider(
                create: (context) => MyRepository(),
                child: BlocProvider<BlocCounter>(
                    create: (context) => BlocCounter(), child: MyWidget()))));
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final blocCounter = BlocProvider.of<BlocCounter>(context);
    final myRepository = RepositoryProvider.of<MyRepository>(context);

    return BlocConsumer<BlocCounter, int>(buildWhen: (prev, curr) {
      return true;
    }, builder: (context, count) {
      return Container(
          color: Colors.deepOrange,
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Text('BlocConsumer.count: $count',
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                ElevatedButton(
                    onPressed: () {
                      blocCounter.add(IncrEvent());
                      myRepository.func();
                    },
                    child: const Text('INCR!!')),
                ElevatedButton(
                    onPressed: () {
                      blocCounter.add(DecrEvent());
                      myRepository.func();
                    },
                    child: const Text('DECR!!')),
              ])));
    }, listenWhen: (prev, curr) {
      return true;
    }, listener: (context, state) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('$state'),
        backgroundColor: Colors.blue,
      ));
    });
  }
}
