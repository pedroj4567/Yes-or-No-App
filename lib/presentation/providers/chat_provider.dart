import 'package:flutter/material.dart';
import 'package:yes_or_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_or_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  //controlador del scrol

  final chatController = ScrollController();
  final getNotAnswer = GetYesNoAnswer();
  // lista de mensajes
  List<Message> messageList = [];

  //creamos el metodo para enviar los mensajes y almacenarlos
  Future<void> sendMessage(String text) async {
    //evaluamos que si me llega el message
    if (text.isEmpty) return;

    //creamos el mensaje
    final newMessage = Message(text: text, fromWho: FromWho.me);
    // lo agrgamos a la lista d emensajes
    messageList.add(newMessage);

    //respuesta de la api
    if (text.endsWith('?')) {
      herReply();
    }
    // En el chageNotifier usamos tambien algo como el setState
    notifyListeners(); // Notifica a los wirdgets que estan subscritos que hubo un cambio

    //luego de notificar el nuevo mensaje
    // aplicamos la animacion del scroll

    moveScrollToBottom();
  }

  Future<void> herReply() async {
    final herMessage = await getNotAnswer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    //retardamos hastya tener el elemento, para mejor interesaccion
    await Future.delayed(
      const Duration(milliseconds: 100),
    );

    chatController.animateTo(
      chatController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
