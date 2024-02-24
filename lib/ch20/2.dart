import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class User {
  String name;
  String address;

  User(this.name, this.address);
}

abstract class UserEvent {
  User user;

  UserEvent(this.user);
}

class CreateUserEvent extends UserEvent {
  CreateUserEvent(super.user);
}

class UpdateUserEvent extends UserEvent {
  UpdateUserEvent(super.user);
}

class UserBloc extends Bloc<UserEvent, User?> {
  UserBloc() : super(null) {
    on<CreateUserEvent>((event, emit) {
      emit(event.user);
    });
    on<UpdateUserEvent>((event, emit) {
      emit(event.user);
    });
  }
}

abstract class CounterEvent {
  int no;

  CounterEvent(this.no);
}

class IncrEvent extends CounterEvent {
  IncrEvent(super.no);
}

class DecrEvent extends CounterEvent {
  DecrEvent(super.no);
}

class BlocCounter extends Bloc<CounterEvent, int> {
  BlocCounter() : super(0) {
    on<IncrEvent>((event, emit) {
      emit(state + event.no);
    });
    on<DecrEvent>((event, emit) {
      emit(state - event.no);
    });
  }
}

class MyBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('MyBlocObserver::onTransition() ${transition}');
  }
}

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('Bloc Observer')),
            body: MultiBlocProvider(
              providers: [
                BlocProvider<BlocCounter>(create: (context) => BlocCounter()),
                BlocProvider<UserBloc>(create: (context) => UserBloc())
              ],
              child: MyWidget(),
            )));
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('MyWidget::build()');
    final blocCounter = BlocProvider.of<BlocCounter>(context);
    final userBloc = BlocProvider.of<UserBloc>(context);

    return MultiBlocListener(
        listeners: [
          BlocListener<BlocCounter, int>(
            listenWhen: (prev, curr) {
              return true;
            },
            listener: (context, state) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('BlocListener<BlocCounter, int>, $state'),
                backgroundColor: Colors.red,
              ));
            },
          ),
          BlocListener<UserBloc, User?>(listenWhen: (prev, curr) {
            return true;
          }, listener: (context, state) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('BlocListener<UserBloc, User?>, $state'),
              backgroundColor: Colors.blue,
            ));
          })
        ],
        child: Container(
            color: Colors.deepOrange,
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  BlocBuilder<BlocCounter, int>(buildWhen: (prev, curr) {
                    return true;
                  }, builder: (context, count) {
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('blocCounter.state -> ${blocCounter.state}',
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          Text('this.count -> $count',
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          ElevatedButton(
                              onPressed: () {
                                blocCounter.add(IncrEvent(5));
                              },
                              child: const Text('INCR!!')),
                          ElevatedButton(
                              onPressed: () {
                                blocCounter.add(DecrEvent(5));
                              },
                              child: const Text('DECR!!')),
                        ]);
                  }),
                  BlocBuilder<UserBloc, User?>(buildWhen: (prev, curr) {
                    return true;
                  }, builder: (context, user) {
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('UserName ${user?.name ?? 'nil'}'),
                          Text('UserAddr ${user?.address ?? 'nil'}'),
                          ElevatedButton(
                              onPressed: () {
                                userBloc.add(CreateUserEvent(
                                    User('Ballbot', '강원특별자치도 춘천시 공지로')));
                              },
                              child: const Text('CreateUserEvent()')),
                          ElevatedButton(
                              onPressed: () {
                                userBloc.add(UpdateUserEvent(
                                    User('Eggbot', '경기도 수원시 장안구 경수대로')));
                              },
                              child: const Text('UpdateUserEvent()')),
                        ]);
                  })
                ]))));
  }
}
