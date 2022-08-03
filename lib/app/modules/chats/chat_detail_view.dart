import 'package:chat_app/app/data/models/index.dart';
import 'package:chat_app/app/modules/chats/chat_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../gen/assets.gen.dart';
import '../../core/utils/colors.dart';

class ChatDetailView extends GetView<ChatController> {
  const ChatDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = Get.arguments;
    if (data != null) {
      controller.getChatRoom(data);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(data.fullName),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Assets.icons.icBack.svg(),
          onPressed: () => controller.cleanChatRoom(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<ChatController>(
              builder: (ctrl) {
                if (ctrl.chatroomCtrl != null) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection("chatrooms")
                          .doc(controller.chatroomCtrl?.chatroomid)
                          .collection("messages")
                          .orderBy("dateTime", descending: true)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          QuerySnapshot dataSnapshot =
                              snapshot.data as QuerySnapshot;

                          if (dataSnapshot.docs.isNotEmpty) {
                            return ListView.builder(
                              reverse: true,
                              itemCount: dataSnapshot.docs.length,
                              itemBuilder: (context, index) {
                                MessageModel currentMessage =
                                    MessageModel.fromJson(
                                        dataSnapshot.docs[index].data()
                                            as Map<String, dynamic>);

                                return Align(
                                  alignment: (currentMessage.idSender ==
                                          controller.getUidCurrentUser())
                                      ? Alignment.centerRight
                                      : Alignment.centerLeft,
                                  child: ConstrainedBox(
                                    constraints:
                                        const BoxConstraints(maxWidth: 270),
                                    child: currentMessage.typeMessage == 'text'
                                        ? Container(
                                            margin: const EdgeInsets.symmetric(
                                              vertical: 6,
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 10,
                                              horizontal: 8,
                                            ),
                                            decoration: BoxDecoration(
                                              color: (currentMessage.idSender ==
                                                      controller
                                                          .getUidCurrentUser())
                                                  ? ColorConstants.primaryRed
                                                  : ColorConstants.blackB10,
                                              borderRadius: BorderRadius.only(
                                                topLeft: (currentMessage
                                                            .idSender ==
                                                        controller
                                                            .getUidCurrentUser())
                                                    ? const Radius.circular(16)
                                                    : const Radius.circular(0),
                                                topRight: (currentMessage
                                                            .idSender ==
                                                        controller
                                                            .getUidCurrentUser())
                                                    ? const Radius.circular(0)
                                                    : const Radius.circular(16),
                                                bottomLeft:
                                                    const Radius.circular(16),
                                                bottomRight:
                                                    const Radius.circular(16),
                                              ),
                                            ),
                                            child: Text(
                                              currentMessage.message.toString(),
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: (currentMessage
                                                          .idSender ==
                                                      controller
                                                          .getUidCurrentUser())
                                                  ? TextAlign.right
                                                  : TextAlign.left,
                                              maxLines: 10,
                                              softWrap: false,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: (currentMessage
                                                              .idSender ==
                                                          controller
                                                              .getUidCurrentUser())
                                                      ? Colors.white
                                                      : ColorConstants.blackB90,
                                                  height: 1.3),
                                            ))
                                        : Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10),
                                            child: Image.network(
                                              currentMessage.message.toString(),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                  ),
                                );
                              },
                            );
                          } else {
                            return const Center(
                              child: Text("Say hi to your friend."),
                            );
                          }
                        } else if (snapshot.hasError) {
                          return const Center(
                            child: Text(
                                "An error occured! Please check your internet connection."),
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
          const Divider(
            thickness: 1,
          ),
          _buildComposer(),
        ],
      ),
    );
  }

  Widget _buildComposer() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          IconButton(
            onPressed: controller.selectFile,
            icon: Assets.icons.icLink.svg(),
            color: Colors.blue,
          ),
          IconButton(
            onPressed: controller.selectImageFromCamera,
            icon: Assets.icons.icCamera.svg(),
            color: Colors.blue,
          ),
          GetBuilder<ChatController>(
            builder: (ctrl) {
              if (ctrl.file != null) {
                return Expanded(
                  child: Stack(
                    children: [
                      Image.file(
                        ctrl.file!,
                      ),
                      Positioned(
                        right: 0,
                        child: IconButton(
                          onPressed: controller.clearFile,
                          icon: Assets.icons.icClose.svg(),
                          color: ColorConstants.primaryRed,
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                      color: ColorConstants.blackB10,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: TextField(
                      controller: controller.messTextCtrl,
                      keyboardType: TextInputType.multiline,
                      minLines: 1,
                      maxLines: 4,
                      decoration: const InputDecoration.collapsed(
                        hintText: 'Your message here...',
                      ),
                    ),
                  ),
                );
              }
            },
          ),
          IconButton(
            onPressed: controller.sendNewMessage,
            icon: Assets.icons.icSend.svg(),
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
