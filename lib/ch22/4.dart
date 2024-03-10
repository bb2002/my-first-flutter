import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  runApp(MyApp());
}

class User {
  int? id;
  String? name;
  String? address;

  Map<String, Object?> toMap() {
    var map = <String, Object?>{"name": name, "address": address};
    if (id != null) {
      map["id"] = id;
    }
    return map;
  }

  User.fromData(this.name, this.address);

  User.fromMap(Map<String, Object?> map) {
    id = map["id"] as int;
    name = map["name"] as String;
    address = map["address"] as String;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQFlite Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NativePluginWidget(),
    );
  }
}

class NativePluginWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NativePluginWidgetState();
  }
}

class NativePluginWidgetState extends State<NativePluginWidget> {
  late Database db;
  int lastId = 0;

  void createTable() async {
    db = await openDatabase('test.db', version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
        CREATE TABLE User (
          id INTEGER PRIMARY KEY,
          name TEXT,
          address TEXT
        );
      ''');
    });

    var item =
        await db.query('User', columns: ['id'], orderBy: 'id DESC', limit: 1);
    if (item.isNotEmpty) {
      var user = User.fromMap(item as Map<String, Object?>);
      lastId = user.id ?? 0;
    }
  }

  void insert() async {
    ++lastId;
    User user =
        User.fromData("GLaDOS ID: $lastId", "Chuncheon, GLaDOS Gil $lastId");
    lastId = await db.insert("User", user.toMap());
    print('Inserted $lastId');
  }

  void update() async {
    User user = User.fromData(
        'Ballbot ID ${lastId - 1}', 'Chuncheon, GLaDOS Gil ${lastId - 1}');
    await db
        .update("User", user.toMap(), where: "id=?", whereArgs: [lastId - 1]);
    print('Updated ${lastId - 1}');
  }

  void delete() async {
    await db.delete("User", where: "id=?", whereArgs: [lastId - 1]);
    lastId--;
    print('Deleted ${lastId - 1}');
  }

  void query() async {
    List<Map> maps = await db.query('User', columns: ['id', 'name', 'address']);
    List<User> users = List.empty(growable: true);
    maps.forEach((element) {
      users.add(User.fromMap(element as Map<String, Object?>));
    });

    users.forEach((element) {
      print('User ${element.id} -> ${element.name}, ${element.address}');
    });
  }

  @override
  void initState() {
    super.initState();
    createTable();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('SQFLite')),
        body: Container(
            color: Colors.indigo,
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  ElevatedButton(onPressed: insert, child: Text('INSERT!')),
                  ElevatedButton(onPressed: update, child: Text('UPDATE!')),
                  ElevatedButton(onPressed: delete, child: Text('DELETE!')),
                  ElevatedButton(onPressed: query, child: Text('QUERY!')),
                ]))));
  }
}
