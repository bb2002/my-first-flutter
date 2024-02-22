import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CounterEvent {
  int no;

  CounterEvent(this.no);
}

class IncrEvent extends CounterEvent {
  IncrEvent(int no) : super(no);
}

class DecrEvent extends CounterEvent {
  DecrEvent(int no) : super(no);
}

class BlocCounter extends Bloc<CounterEvent, int> {
  BlocCounter() : super(0) {
    on<IncrEvent>((event, emit) => emit(state + event.no));
    on<DecrEvent>((event, emit) => emit(state - event.no));
  }

  @override
  void onEvent(CounterEvent event) {
    super.onEvent(event);
    print('onEvent() ${event.no}');
  }

  @override
  void onTransition(Transition<CounterEvent, int> transition) {
    super.onTransition(transition);
    print('onTransition() ${transition}');
  }

  @override
  void onError(Object error, StackTrace trace) {
    super.onError(error, trace);
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
            appBar: AppBar(title: Text('Bloc')),
            body: BlocProvider<BlocCounter>(
              create: (context) => BlocCounter(),
              child: MyWidget(),
            )));
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BlocCounter counterBloc = BlocProvider.of<BlocCounter>(context);
    return BlocBuilder<BlocCounter, int>(builder: (context, count) {
      return Container(
          color: Colors.orange,
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Text('${counterBloc.state}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white)),
                ElevatedButton(
                    onPressed: () {
                      counterBloc.add(IncrEvent(5));
                    },
                    child: Text('INCR!')),
                ElevatedButton(
                    onPressed: () {
                      counterBloc.add(DecrEvent(5));
                    },
                    child: Text('DECR!')),
              ])));
    });
  }
}
