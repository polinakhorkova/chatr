import 'package:chatr/app/services/user_service.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

class HomeController extends GetxController {
  final textCtrl = TextEditingController();
  void sighIn() {
    String username = textCtrl.text;
    print(username);
    UserService.to.setUsernameAmdConnect(username);
  }
}
