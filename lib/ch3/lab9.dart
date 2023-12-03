main() {
  List<int> list1 = [10, 1234, 3];
  list1[0] = 20;
  list1.add(40);
  list1.removeAt(0);
  print(list1);

  var list2 = List<int?>.filled(1, null, growable: true);
  list2[0] = 10;
  list2.add(20);
  print(list2);

  Set<int> set1 = { 10,20,30,10 };
  print(set1);
  set1.add(20);
  for (final a in set1) {
    print(a);
  }

  dynamic a;
  a = null;
  a = 10;
  a = '';
}
