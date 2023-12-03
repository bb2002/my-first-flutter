import 'package:flutter_lab/ch3/lab3.dart' hide no1;
import 'package:flutter_lab/ch3/lab1.dart' show no;


main() {
  print('no: $no');
  // no1 = 11;
  // _no2 = 22;

  sayHello();
  // _sayHello();

  User1 user1 = User1();
  // _User2

  user1.name = 'Ballbot';
  // user1._address = 'asdf'
}