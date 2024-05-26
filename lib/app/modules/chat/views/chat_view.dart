import 'package:chatr/app/data/socket_event.dart';
import 'package:chatr/app/modules/chat/widget/bubble_message.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/chat_controller.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ЧАТ'),
          actions: [
            IconButton(
                onPressed: () {
                  controller.disconnect();
                },
                icon: const Icon(Icons.logout))
          ],
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
                child: Obx(() => ListView.builder(
                      controller: controller.scrollCtrl,
                      itemCount: controller.messages.length,
                      itemBuilder: (context, index) {
                        var message = controller.messages[index];
                        var itsMe = controller.itsMe(message.clientId);
                        switch (message.type) {
                          case SocketEvent.login:
                            return Center(
                                child: Text(
                                    "${message.username} entered the chat "));
                          case SocketEvent.newMessage:
                            return BubbleMessage(
                                message: message, itsMe: itsMe);
                          default:
                            return const SizedBox();
                        }
                      },
                    ))),
                    TextFormField( controller: controller.textCtrl,
                    onEditingComplete: controller.sendMessage(),
                    decoration: InputDecoration( suffixIcon: IconButton(onPressed: () => controller.sendMessage(), icon: const Icon(Icons.send))),),
          ],
        ));
  }
}
