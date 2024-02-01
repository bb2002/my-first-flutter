import 'package:flutter/material.dart';

void main() {
  runApp(ParentWidget());
}

class ParentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ParentWidgetState();
}

class ParentWidgetState extends State<ParentWidget> {
  bool isFavorited = false;
  int favoriteCount = 0;

  onClicked() {
    setState(() {
      if (isFavorited) {
        favoriteCount -= 1;
      } else {
        favoriteCount += 1;
      }
      isFavorited = !isFavorited;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text('Parent')),
          body: Center(
              child: Column(children: [
            FavoriateWidget(onClicked, isFavorited),
            CountWidget(favoriteCount)
          ]))),
    );
  }
}

class FavoriateWidget extends StatelessWidget {
  final bool isFavorited;
  final Function onChanged;

  FavoriateWidget(this.onChanged, this.isFavorited);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          onChanged();
        },
        iconSize: 200,
        color: Colors.pink,
        icon:
            (isFavorited ? Icon(Icons.favorite) : Icon(Icons.favorite_border)));
  }
}

class CountWidget extends StatelessWidget {
  final int favoriteCount;

  CountWidget(this.favoriteCount);

  @override
  Widget build(BuildContext context) {
    return Text('좋아요 한 사람 수: $favoriteCount');
  }
}
