import 'package:chat_app/app/core/utils/colors.dart';
import 'package:chat_app/app/modules/chats/widgets/user_list_chat.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.whiteW50,
      appBar: AppBar(
        title: const Text('Chat'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: const UserListView(),
    );
  }
}
