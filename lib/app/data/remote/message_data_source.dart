import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/message_model.dart';

abstract class MessageDataSource {
  Future<void> sendMessage(MessageModel newMessage, String chatRoomId);
  Future<Stream<QuerySnapshot>> streamMessageContent(String chatRoomId);
}

class MessageDataSourceImpl implements MessageDataSource {
  @override
  Future<void> sendMessage(MessageModel newMessage, String chatRoomId) async {
    FirebaseFirestore.instance
        .collection("chatrooms")
        .doc(chatRoomId)
        .collection("messages")
        .doc(newMessage.messageId)
        .set(newMessage.toJson());
  }

  @override
  Future<Stream<QuerySnapshot>> streamMessageContent(String chatRoomId) async {
    return FirebaseFirestore.instance
        .collection("chatrooms")
        .doc(chatRoomId)
        .collection("messages")
        .orderBy("create", descending: true)
        .snapshots(includeMetadataChanges: true);
  }
}
