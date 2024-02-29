import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text("SharedPreferences")),
      body: HomeWidget(),
    ));
  }
}

class HomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeWidgetState();
  }
}

const SLIDER_VALUE = 'dev.ballbot.first_flutter.slider_value';
const SWITCH_VALUE = 'dev.ballbot.first_flutter.switch_value';

class HomeWidgetState extends State<HomeWidget> {
  late SharedPreferences pref;

  double sliderValue = 0.0;
  bool switchValue = false;

  @override
  void initState() {
    super.initState();
    (() async {
      pref = await SharedPreferences.getInstance();
      final _sliderValue = pref.getDouble(SLIDER_VALUE);
      final _switchValue = pref.getBool(SWITCH_VALUE);

      if (_sliderValue != null) {
        setState(() {
          sliderValue = _sliderValue;
        });
      }

      if (_switchValue != null) {
        setState(() {
          switchValue = _switchValue;
        });
      }
    })();
  }

  save() async {
    await pref.setDouble(SLIDER_VALUE, sliderValue);
    await pref.setBool(SWITCH_VALUE, switchValue);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Slider(
        value: sliderValue,
        min: 0,
        max: 100,
        onChanged: (double value) {
          setState(() {
            sliderValue = value;
          });
        },
      ),
      Switch(
        value: switchValue,
        onChanged: (bool value) {
          setState(() {
            switchValue = value;
          });
        },
      ),
      ElevatedButton(onPressed: save, child: Text('SAVE')),
    ])));
  }
}
