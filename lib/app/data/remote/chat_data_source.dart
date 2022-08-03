import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';

abstract class ChatDataSource {
  UploadTask? uploadFile(String destination, File file);
  UploadTask? uploadBytes(String destination, Uint8List data);
}

class ChatDataSourceImpl implements ChatDataSource {
  final _storage = FirebaseStorage.instance;
  @override
  UploadTask? uploadFile(String destination, File file) {
    final ref = _storage.ref(destination);
    return ref.putFile(file);
  }

  @override
  UploadTask? uploadBytes(String destination, Uint8List data) {
    final ref = _storage.ref(destination);
    return ref.putData(data);
  }
}
