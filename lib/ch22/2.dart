import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Picker',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeWidget(),
    );
  }
}

class HomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeWidgetState();
  }
}

class HomeWidgetState extends State<HomeWidget> {
  XFile? file;

  Future getGalleryImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      file = image;
    });
  }

  Future getCameraImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      file = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Image Picker')),
        body: Container(
            color: Colors.indigo,
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  ElevatedButton(
                      onPressed: getGalleryImage, child: const Text('Gallery')),
                  Center(
                      child: file == null
                          ? Text('No Image Selected',
                              style: const TextStyle(color: Colors.white))
                          : CircleAvatar(
                              backgroundImage: FileImage(File(file!.path)),
                              radius: 100,
                            )),
                  ElevatedButton(
                      onPressed: getCameraImage, child: const Text('Camera')),
                ]))));
  }
}
