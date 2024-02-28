import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainWidget(),
    );
  }
}

class MainWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainWidgetState();
  }
}

class MainWidgetState extends State<MainWidget> {
  String? latitude;
  String? longitude;

  getGeolocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Permission denied');
        return;
      }
    }

    Position pos = await Geolocator.getCurrentPosition();
    setState(() {
      latitude = pos.latitude.toString();
      longitude = pos.longitude.toString();
    });
  }

  @override
  void initState() {
    super.initState();
    getGeolocationPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Geolocator')),
        body: Container(
            color: Colors.indigo,
            child: Center(
                child: Column(children: [
              Text('MyLocation:::',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              Text('latitude: $latitude',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
              Text('longitude: $longitude',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20)),
            ]))));
  }
}
