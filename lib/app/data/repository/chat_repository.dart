import 'dart:io';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

import '../models/message_model.dart';
import '../remote/chat_data_source.dart';

abstract class ChatRepository {
  UploadTask? uploadFile(String destination, File file);
  UploadTask? uploadBytes(String destination, Uint8List data);
  Future<void> sendMessage(MessageModel newMessage, String chatRoomId);
}

class ChatRepositoryImpl implements ChatRepository {
  final _chatDataSource = Get.find<ChatDataSource>();

  @override
  UploadTask? uploadBytes(String destination, data) {
    return _chatDataSource.uploadBytes(destination, data);
  }

  @override
  UploadTask? uploadFile(String destination, File file) {
    return _chatDataSource.uploadFile(destination, file);
  }

  @override
  Future<void> sendMessage(MessageModel newMessage, String chatRoomId) async {}
}
