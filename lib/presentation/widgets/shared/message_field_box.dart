import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged onValue;

  const MessageFieldBox({
    super.key,
    required this.onValue,
  });

  @override
  Widget build(BuildContext context) {
    //controlador del input form
    final textController = TextEditingController();
    final focuNode = FocusNode();

    // estilos del input

    final outlineInputBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40),
    );

    final inputDecoration = InputDecoration(
      filled: true,
      hintText: 'End your message with a "?"',
      hintStyle: TextStyle(fontSize: 18),
      focusedBorder: outlineInputBorder,
      enabledBorder: outlineInputBorder,
      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      suffixIcon: IconButton(
        onPressed: () {
          final textValue = textController.value.text;
          textController.clear();
          onValue(textValue);
        },
        icon: Icon(
          Icons.send_outlined,
        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: TextFormField(
        onTapOutside: (event) => focuNode.unfocus(),
        cursorHeight: 20,
        focusNode: focuNode,
        decoration: inputDecoration,
        // controla el flujo o los datos a proesar
        controller: textController,
        //  funcion submit para el campo
        onFieldSubmitted: (value) {
          textController.clear();
          focuNode.requestFocus();
          onValue(value);
        },
        // detecta los cambios en el input
      ),
    );
  }
}
