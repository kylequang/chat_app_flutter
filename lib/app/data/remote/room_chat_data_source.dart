import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/chat_room_model.dart';

abstract class RoomChatDataSource {
  Future<QuerySnapshot> getRoomChat(String uidCurrentUser, String uidReciver);
  Future<void> createNewChatRoom(ChatRoomModel newChatRoom);
  Future<void> updateLastMessage(ChatRoomModel chatRoom);
  Stream<QuerySnapshot> getParticipantsInChatRoomByUidUser(
      String uidCurrentUser);
}

class RoomChatDataSourceImpl implements RoomChatDataSource {
  @override
  Future<QuerySnapshot> getRoomChat(String uidCurrentUser, String uidReciver) {
    return FirebaseFirestore.instance
        .collection("chatrooms")
        .where("participants.$uidCurrentUser", isEqualTo: true)
        .where("participants.$uidReciver", isEqualTo: true)
        .get();
  }

  @override
  Future<void> createNewChatRoom(ChatRoomModel newChatRoom) async {
    FirebaseFirestore.instance
        .collection("chatrooms")
        .doc(newChatRoom.chatroomid)
        .set(newChatRoom.toJson());
  }

  @override
  Future<void> updateLastMessage(ChatRoomModel chatRoom) async {
    FirebaseFirestore.instance
        .collection("chatrooms")
        .doc(chatRoom.chatroomid)
        .set(chatRoom.toJson());
  }

  @override
  Stream<QuerySnapshot> getParticipantsInChatRoomByUidUser(
      String uidCurrentUser) {
    return FirebaseFirestore.instance
        .collection("chatrooms")
        .where("participants.$uidCurrentUser", isEqualTo: true)
        .snapshots(includeMetadataChanges: true);
  }
}
