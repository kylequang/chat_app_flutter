import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../models/message_model.dart';
import '../remote/message_data_source.dart';

abstract class MessageRepository {
  Future<void> sendMessage(MessageModel newMessage, String chatRoomId);
  Future<Stream<QuerySnapshot>> streamMessageContent(String chatRoomId);
}

class MessageRepositoryImpl implements MessageRepository {
  final messageDataSoure = Get.find<MessageDataSource>();
  @override
  Future<void> sendMessage(MessageModel newMessage, String chatRoomId) async {
    messageDataSoure.sendMessage(newMessage, chatRoomId);
  }

  @override
  Future<Stream<QuerySnapshot>> streamMessageContent(String chatRoomId) async {
    return messageDataSoure.streamMessageContent(chatRoomId);
  }
}
