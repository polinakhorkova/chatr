import 'package:get/get.dart';

import '../controllers/chat_controller.dart';

class ChatBinding implements Bindings { //IMPLEMENTS
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(
      () => ChatController(),
    );
  }
}
