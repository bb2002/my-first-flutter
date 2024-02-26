import 'package:flutter/material.dart';
import "package:get/get.dart";

class User {
  String name = '';
  int age = 0;
}

class CounterController extends GetxController {
  var count = 0.obs;
  var isChecked = Rx<bool>(false);
  var title = RxString('');
  var user = Rx<User>(User());

  @override
  void onInit() {
    super.onInit();
    ever(count, (value) => print('EVER!!: $value'));
    once(count, (value) => print('ONCE!!: $value'));
    debounce(count, (value) => print('DEBOUNCE!!: $value'),
        time: const Duration(seconds: 1));
    interval(count, (value) => print('INTERVAL!!: $value'),
        time: const Duration(seconds: 1));
  }

  @override
  void onClose() {
    super.onClose();
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(CounterController());

    return GetMaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('GetX Rx Test')),
      body: MyWidget(),
    ));
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<CounterController>(builder: (controller) {
      return Container(
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
            Text(
                'GetX: ${controller.count.value}, ${controller.isChecked.value}, ${controller.title.value}',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
            Text(
                'GetX: ${controller.user.value.name}, ${controller.user.value.age}',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
            ElevatedButton(
                onPressed: () {
                  controller.isChecked.value = !controller.isChecked.value;
                  if (controller.title.value == 'Hello') {
                    controller.title.value = 'World';
                  } else {
                    controller.title.value = 'Hello';
                  }

                  if (controller.user.value.name == 'Ballbot') {
                    controller.user.value.name = 'Eggbot';
                  } else {
                    controller.user.value.name = 'Ballbot';
                  }

                  controller.user.value.age++;
                },
                child: const Text('RUN!!'))
          ])));
    });
  }
}
