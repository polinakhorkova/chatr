import 'package:chatr/app/data/models/chat_message.dart';
import 'package:chatr/app/services/socket_service.dart';
import 'package:get/get.dart';

class UserService extends GetxService {
  static UserService get to => Get.find();

  String username = '';
  final messages = RxList<ChatMessage>.empty();

  Future<UserService> init() async {
    return this;
  }

  void setUsernameAmdConnect(String user) {
    username = user;
    SocketService.to.connect;
  }

  void addMessageToList(ChatMessage message) {
    printInfo(info: 'New message: $message');
    messages.add(message);
  }

  void clearMessage() => messages.clear();
}
