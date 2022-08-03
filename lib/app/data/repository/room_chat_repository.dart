import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../models/chat_room_model.dart';
import '../remote/room_chat_data_source.dart';

abstract class RoomChatRepository {
  Future<ChatRoomModel?> getChatRoom(String uidCurrentUser, String uidReciver);
  Future<void> createNewChatRoom(ChatRoomModel newChatRoom);
  Future<void> updateLastMessage(ChatRoomModel chatRoom);
  Stream<QuerySnapshot> getParticipantsInChatRoomByUidUser(
      String uidCurrentUser);
}

class RoomChatRepositoryImpl implements RoomChatRepository {
  final roomChatDataSource = Get.find<RoomChatDataSource>();
  @override
  Future<void> createNewChatRoom(ChatRoomModel newChatRoom) async {
    await roomChatDataSource.createNewChatRoom(newChatRoom);
  }

  @override
  Future<ChatRoomModel?> getChatRoom(
      String uidCurrentUser, String uidReciver) async {
    final snapshot =
        await roomChatDataSource.getRoomChat(uidCurrentUser, uidReciver);
    if (snapshot.docs.isNotEmpty) {
      var docData = snapshot.docs[0].data();
      return ChatRoomModel.fromJson(docData as Map<String, dynamic>);
    }
    return null;
  }

  @override
  Future<void> updateLastMessage(ChatRoomModel chatRoom) async {
    roomChatDataSource.updateLastMessage(chatRoom);
  }

  @override
  Stream<QuerySnapshot> getParticipantsInChatRoomByUidUser(
      String uidCurrentUser) {
    return roomChatDataSource
        .getParticipantsInChatRoomByUidUser(uidCurrentUser);
  }
}
