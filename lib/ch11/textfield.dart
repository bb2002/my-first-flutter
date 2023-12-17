import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

@override
void initState() {}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final controller = TextEditingController();
  int textLength = 0;
  bool isChecked = false;
  String selectedPlatform = "Windows";
  double telnum = 1000000000;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        print("textField: ${controller.value.text}");
        textLength = controller.value.text.length;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: const Text('TextField')),
            body: Column(
              children: [
                TextField(
                  style: const TextStyle(fontSize: 15.0),
                  controller: controller,
                  decoration: InputDecoration(
                    labelText: '이름을 입력하세여',
                    prefixIcon: Icon(Icons.input),
                    border: OutlineInputBorder(),
                    hintText: "Hint Text",
                    helperText: "근데 비밀번호 처럼 뜸 ㅋㅋ",
                    counterText: "$textLength / 8",
                  ),
                  textInputAction: TextInputAction.go,
                  keyboardType: TextInputType.emailAddress,
                  maxLength: 8,
                ),
                Checkbox(
                    value: isChecked,
                    onChanged: (bool? checked) {
                      setState(() {
                        isChecked = checked ?? false;
                      });
                    }),
                Text('isChecked: $isChecked'),
                Row(
                  children: [
                    Radio(
                        value: "Android",
                        groupValue: selectedPlatform,
                        onChanged: (String? val) {
                          setState(() {
                            selectedPlatform = val ?? "Android";
                          });
                        }),
                    const Text("인조인간"),
                    Radio(
                        value: "iOS",
                        groupValue: selectedPlatform,
                        onChanged: (String? val) {
                          setState(() {
                            selectedPlatform = val ?? "iOS";
                          });
                        }),
                    const Text("사과전화"),
                    Text("selectedPlatform: $selectedPlatform"),
                  ],
                ),
                const Text("전화번호를 입력하세여"),
                Slider(
                    value: telnum,
                    min: 1000000000,
                    max: 1099999999,
                    onChanged: (double value) {
                      setState(() {
                        telnum = value.roundToDouble();
                      });
                    }),
                Text("전화번호: $telnum")
              ],
            )));
  }
}
