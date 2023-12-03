int? no = 10;

main() {
  bool? data = no?.isEven;
  no = null;
  Object? obj = no;

  int no1 = 10;
  double do1 = no1.toDouble();
  String st1 = no1.toString();
  int nost = int.parse(st1);

  happy(nost);
  happy('test');

  var anyany;
  anyany = 10;
  anyany = 'Hello';
  happy(anyany);
}

happy(var a) {
  print(a);
}

const String data1 = 'Hello from dart.';
class User {
  static const String data2 = 'Hello from User.';
  final int data4;

  User(this.data4);

  void some() {
    const String data3 = 'Hello from some.';
    final data5;
    data5 = 10;
  }
}