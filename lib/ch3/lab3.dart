int no1 = 10;
int _no2 = 20;

void sayHello() {
  print('sayHello()');
}

void _sayHello() {
  print('_sayHello()');
}

class User1 {
  String? name;
  String _address = 'Chunchon';
}

class _User2 {}

main() {
  no1 = 11;
  _no2 = 22;

  sayHello();
  _sayHello();

  User1 user1 = User1();
  _User2 user2 = _User2();

  user1.name = 'Ballbot';
  user1._address = 'Seoul';
  print('${user1.name}, ${user1._address}');
}