import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding implements Bindings {//IMPLEMENTS
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
