import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class User {
  String name;
  String phone;
  String email;
  AssetImage image;
  User(this.name, this.phone, this.email, this.image);
}

class MyApp extends StatelessWidget {
  List<User> users = [
    User('볼봇', '010-1234-5678', 'ballbot@atlascity.gov',
        const AssetImage('images/val.jpg')),
    User('글라도스', '010-3333-4444', 'glados@atlascity.gov',
        const AssetImage('images/val.jpg')),
    User('에그봇', '010-5555-6666', 'eggbot@atlascity.gov',
        const AssetImage('images/val.jpg')),
    User('휘틀리', '010-2222-3333', 'whetly@atlascity.gov',
        const AssetImage('images/val.jpg')),
    User('볼봇', '010-1234-5678', 'ballbot@atlascity.gov',
        const AssetImage('images/val.jpg')),
    User('글라도스', '010-3333-4444', 'glados@atlascity.gov',
        const AssetImage('images/val.jpg')),
    User('에그봇', '010-5555-6666', 'eggbot@atlascity.gov',
        const AssetImage('images/val.jpg')),
    User('휘틀리', '010-2222-3333', 'whetly@atlascity.gov',
        const AssetImage('images/val.jpg')),
    User('볼봇', '010-1234-5678', 'ballbot@atlascity.gov',
        const AssetImage('images/val.jpg')),
    User('글라도스', '010-3333-4444', 'glados@atlascity.gov',
        const AssetImage('images/val.jpg')),
    User('에그봇', '010-5555-6666', 'eggbot@atlascity.gov',
        const AssetImage('images/val.jpg')),
    User('휘틀리', '010-2222-3333', 'whetly@atlascity.gov',
        const AssetImage('images/val.jpg')),
    User('볼봇', '010-1234-5678', 'ballbot@atlascity.gov',
        const AssetImage('images/val.jpg')),
    User('글라도스', '010-3333-4444', 'glados@atlascity.gov',
        const AssetImage('images/val.jpg')),
    User('에그봇', '010-5555-6666', 'eggbot@atlascity.gov',
        const AssetImage('images/val.jpg')),
    User('휘틀리', '010-2222-3333', 'whetly@atlascity.gov',
        const AssetImage('images/val.jpg')),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: const Text('Users')),
            body: ListView.separated(
                itemBuilder: itemBuilder,
                separatorBuilder: separatorBuilder,
                itemCount: users.length)));
  }

  Widget itemBuilder(BuildContext context, int index) {
    User user = users[index];
    return ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundImage: user.image,
        ),
        title: Text(user.name),
        subtitle: Text(user.email),
        trailing: const Icon(Icons.more_vert),
        onTap: () {
          print('User: $user');
        });
  }

  Widget separatorBuilder(BuildContext context, int index) {
    return const Divider(height: 2, color: Colors.black38);
  }
}
