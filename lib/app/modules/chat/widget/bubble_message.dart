import 'package:chatr/app/data/models/chat_message.dart';
import 'package:flutter/material.dart';



class BubbleMessage extends StatelessWidget { //сообщение чата
  final ChatMessage message;
  final bool itsMe; //указатель является ли сообщение от текущего пользователя
  const BubbleMessage({super.key, required this.message, required this.itsMe});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: itsMe ? Alignment.topRight : Alignment.topLeft,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: EdgeInsets.only(
            top: 5, bottom: 10, left: itsMe ? 60 : 15, right: itsMe ? 10 : 60),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.white10,
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(2, 2),
            )
          ],
          borderRadius: BorderRadius.circular(10),
          color: itsMe 
              ? Color.fromRGBO(90, 185, 234, 1)//цвет фона сообщения для текущего пользователя
              : Color.fromRGBO(86, 128, 233, 1),//цвет фона сообщения для другого пользователя
        ),
        child: Column(
          crossAxisAlignment:
              itsMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!itsMe)//отображение имени пользователя если это не сообщение от текущего 
              Text( 
                message.username,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            if (!itsMe) //отступ если сообщение не от текущего пользователя
              const SizedBox(
                height: 5,
              ),
            Text(
              message.message,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
