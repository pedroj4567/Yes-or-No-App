import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_or_no_app/domain/entities/message.dart';
import 'package:yes_or_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_or_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_or_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_or_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  final String urlProfileImage =
      'https://media.licdn.com/dms/image/v2/D4E35AQEOr-7oShXdZg/profile-framedphoto-shrink_800_800/profile-framedphoto-shrink_800_800/0/1704689315285?e=1740801600&v=beta&t=UxwRcf9cSQaOYe_xedgUdaOlHjHXJ-9x9pLZ1-6nRnY';

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: colors.primary,
        leading: Padding(
          padding: const EdgeInsets.all(5),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              urlProfileImage,
            ),
          ),
        ),
        title: Text(
          "Mi love <3",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView();

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: chatProvider.messageList.length,
                  controller: chatProvider.chatController,
                  itemBuilder: (item, index) {
                    final message = chatProvider.messageList[index];
                    return message.fromWho == FromWho.her
                        ? HerMessageBubble(
                            message: message,
                          )
                        : MyMessageBubble(
                            message: message,
                          );
                  }),
            ),
            // caja de texto
            MessageFieldBox(
              onValue: (value) {
                chatProvider.sendMessage(value);
              },
            )
          ],
        ),
      ),
    );
  }
}
