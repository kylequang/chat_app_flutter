import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../gen/assets.gen.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/display_helper.dart';
import '../../../core/widgets/empty_data.dart';
import '../../../data/models/chat_room_model.dart';
import '../../../data/models/users_model.dart';
import '../chat_controller.dart';

class UserListView extends GetView<ChatController> {
  const UserListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("chatrooms")
          .where(
            "participants.${controller.getUidCurrentUser()}",
            isEqualTo: true,
          )
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          QuerySnapshot chatRoomSnapshot = snapshot.data as QuerySnapshot;

          if (chatRoomSnapshot.docs.isNotEmpty) {
            return ListView.builder(
              itemCount: chatRoomSnapshot.docs.length,
              itemBuilder: (context, index) {
                ChatRoomModel chatRoomModel = ChatRoomModel.fromJson(
                    chatRoomSnapshot.docs[index].data()
                        as Map<String, dynamic>);

                Map<String, dynamic>? participants = chatRoomModel.participants;
                var keys = participants?.keys.toList();
                keys?.remove(controller.getUidCurrentUser());

                return FutureBuilder(
                    future: controller.getUserById(keys?[0]),
                    builder: (context, userData) {
                      if (userData.data != null) {
                        UsersModel targetUser = userData.data as UsersModel;
                        return ListTile(
                            onTap: () {
                              controller.goToChatDetailFromChatList(
                                targetUser,
                                chatRoomModel,
                              );
                            },
                            leading: Stack(
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    targetUser.avatar.toString(),
                                  ),
                                  radius: 30,
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Icon(
                                    Icons.circle,
                                    size: 16,
                                    color: targetUser.isActive!
                                        ? Colors.green
                                        : Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(targetUser.fullName.toString()),
                                Text(
                                    '${chatRoomModel.dateTime.hour}:${chatRoomModel.dateTime.minute}'),
                              ],
                            ),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      Text(
                                        chatRoomModel.idSender ==
                                                controller.getUidCurrentUser()
                                            ? 'You:  ${chatRoomModel.lastMessage.toString()}'
                                            : '${DisplayHelper.getLastLetter(
                                                chatRoomModel.nameSender,
                                              )}: ${chatRoomModel.lastMessage.toString()}',
                                        style: chatRoomModel.idSender ==
                                                controller.getUidCurrentUser()
                                            ? TextStyle(
                                                color:
                                                    ColorConstants.mainDefault,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16,
                                              )
                                            : !chatRoomModel.seen!
                                                ? const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w800,
                                                    fontSize: 16,
                                                  )
                                                : TextStyle(
                                                    color: ColorConstants
                                                        .mainDefault,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16,
                                                  ),
                                      ),
                                    ],
                                  ),
                                ),
                                chatRoomModel.idSender ==
                                        controller.getUidCurrentUser()
                                    ? Container()
                                    : (chatRoomModel.seen ?? false
                                        ? Container()
                                        : Container(
                                            width: 10,
                                            height: 10,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: ColorConstants.primaryRed,
                                            ),
                                          )),
                              ],
                            ));
                      } else {
                        return Container();
                      }
                    });
              },
            );
          } else {
            return emptyData(
              Assets.images.emptyData.path,
              title: "You don't have chat ! Say hi to new friend",
            );
          }
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
