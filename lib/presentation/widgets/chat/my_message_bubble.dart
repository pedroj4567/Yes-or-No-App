import 'package:flutter/material.dart';
import 'package:yes_or_no_app/domain/entities/message.dart';

class MyMessageBubble extends StatelessWidget {
  // acostumbrase se los envios de datos, es mejor enviar la entidad completa y tipar la misma
  // que solo enviar un parametro en especifo
  final Message message;

  const MyMessageBubble({
    super.key,
    required this.message,
  });

  // para sacar el theme que tenga la app  usamos el theme.of() del contexto

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
