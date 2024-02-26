import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CounterController extends GetxController {
  int count = 0;
  var data = 0.obs;

  @override
  onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void incr() {
    ++count;
    update();
  }

  void decr() {
    --count;
    update();
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('GetX Test')),
            body: GetBuilder(
              init: CounterController(),
              builder: (controller) {
                return MyWidget();
              },
            )));
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final CounterController controller = Get.find();
    return GetBuilder<CounterController>(builder: (controller) {
      return Container(
          color: Colors.deepOrange,
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Text('GetX: ${controller.count}',
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
                ElevatedButton(
                    onPressed: () {
                      controller.incr();
                    },
                    child: const Text('INCR!')),
                ElevatedButton(
                    onPressed: () {
                      controller.decr();
                    },
                    child: const Text('DECR!')),
              ])));
    });
  }
}
