import 'package:flutter/material.dart';

void main() {
  runApp(ParentWidget());
}

class ParentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ParentWidgetState();
}

class ParentWidgetState extends State<ParentWidget> {
  int favoriteCount = 10;
  bool isFavorited = false;
  int childCount = 0;
  GlobalKey<ChildWidgetState> childKey = GlobalKey();

  void toggleFavorite() {
    setState(() {
      if (isFavorited) {
        favoriteCount -= 1;
      } else {
        favoriteCount += 1;
      }
      isFavorited = !isFavorited;
    });
  }

  void getChildData() {
    ChildWidgetState? childState = childKey.currentState;
    setState(() {
      childCount = childState?.childCount ?? -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: const Text('State Test')),
            body:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Row(children: [
                Text('PARENT, child count: $childCount'),
                ElevatedButton(
                    onPressed: getChildData, child: Text('Get Child Data')),
              ]),
              ChildWidget(key: childKey),
              IconWidget(),
              ContentWidget(),
            ])));
  }
}

class ChildWidget extends StatefulWidget {
  ChildWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ChildWidgetState();
}

class ChildWidgetState extends State<ChildWidget> {
  int childCount = 0;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(child: Text('CHILD, $childCount')),
      ElevatedButton(
          onPressed: () {
            setState(() {
              childCount++;
            });
          },
          child: Text('INCR!!'))
    ]);
  }
}

class IconWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ParentWidgetState? state =
        context.findAncestorStateOfType<ParentWidgetState>();

    return Center(
        child: IconButton(
      icon: ((state?.isFavorited ?? false)
          ? const Icon(Icons.favorite)
          : const Icon(Icons.favorite_border)),
      iconSize: 200,
      color: Colors.pink,
      onPressed: state?.toggleFavorite,
    ));
  }
}

class ContentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ParentWidgetState? state =
        context.findAncestorStateOfType<ParentWidgetState>();

    return Center(
        child: Text('favoritecount: ${state?.favoriteCount}',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)));
  }
}
