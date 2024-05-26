import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ВХОД'),
        centerTitle: true,
      ),
      body: Column(children: [
        Text('Введите никнейм'),
        TextField(
          controller: controller.textCtrl,
          onSubmitted: (value) => controller.sighIn(),
        )

      ],)
    );
  }
}
