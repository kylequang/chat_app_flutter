import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:quiver/core.dart';
import 'package:uuid/uuid.dart';
import '../../core/utils/display_helper.dart';
import '../../data/models/chat_room_model.dart';
import '../../data/models/message_model.dart';
import '../../data/models/users_model.dart';
import '../../data/repository/auth_repository.dart';
import '../../data/repository/chat_repository.dart';
import '../../data/repository/message_repository.dart';
import '../../data/repository/profile_repository.dart';
import '../../data/repository/room_chat_repository.dart';
import '../../data/repository/users_repository.dart';
import '../../routes/app_pages.dart';

class ChatController extends GetxController {
  final userRepository = Get.find<UsersRepository>();
  final chatRepository = Get.find<ChatRepository>();
  final roomChatRepository = Get.find<RoomChatRepository>();
  final messageRepository = Get.find<MessageRepository>();
  final resultSearchUser = RxMap();
  final messTextCtrl = TextEditingController();
  final searchController = TextEditingController();
  final searchResult = RxString('');

  ChatRoomModel? chatroomCtrl;
  late Stream messStream;
  late Stream usersListChatStream;
  List<MessageModel> listMessage = [];
  late UsersModel currentUser;

  // users list chat

  Rx<List<ChatRoomModel>> usersListChat = Rx<List<ChatRoomModel>>([]);

//Test Stream
  final userChatList = RxList<ChatRoomModel>();
  Rxn<List<ChatRoomModel>> finalChatsRoom = Rxn<List<ChatRoomModel>>();

  final data = Get.arguments;

  @override
  void onInit() async {
    currentUser = (await getUserById(getUidCurrentUser()))!;
    super.onInit();
  }

  @override
  void onReady() async {
    final data = Get.arguments;
    if (data != null) {
      await getChatRoom(data);
    }
  }

  String getUidCurrentUser() {
    return userRepository.getUidOfCurrentUser();
  }

  Future<UsersModel?> getUserById(uid) async {
    return userRepository.getUserByUid(uid);
  }

  //get chat room
  getChatRoom(data) async {
    print(data.fullName);
    print(data.uid);
    final uidCurrentUser = getUidCurrentUser();
    final room = await roomChatRepository.getChatRoom(
      uidCurrentUser,
      data.uid,
    );

    if (room != null) {
      print('exist room');
      chatroomCtrl = room;
      update();
    } else {
      print("create new room");
      ChatRoomModel newChatroom = ChatRoomModel(
        chatroomid: const Uuid().v1(),
        idSender: getUidCurrentUser(),
        nameSender: currentUser.fullName.toString(),
        dateTime: DateTime.now(),
        lastMessage: "Say hi to your friend",
        participants: {getUidCurrentUser(): true, data.id: true},
        seen: false,
      );
      roomChatRepository.createNewChatRoom(newChatroom);
      chatroomCtrl = newChatroom;
      update();
    }
  }

  void goToChatDetailFromChatList(
      UsersModel reciver, ChatRoomModel chatroom) async {
    if (chatroom.idSender != getUidCurrentUser()) {
      roomChatRepository.updateLastMessage(
        chatroom.copyWith(
          seen: Optional.of(true),
        ),
      );
    }

    chatroomCtrl = chatroom;
    getChatRoom(reciver);
    Get.toNamed(Routes.CHAT_DETAIL, arguments: reciver);
  }

  void cleanChatRoom() {
    chatroomCtrl = null;
    update();
    Get.back();
  }

  //send new message
  void sendNewMessage() async {
    String msg = messTextCtrl.text.trim();
    messTextCtrl.clear();

    if (msg != "") {
      print('run send message');
      MessageModel newMessage = MessageModel(
        messageId: const Uuid().v1(),
        idSender: getUidCurrentUser(),
        dateTime: DateTime.now(),
        message: msg,
        typeMessage: 'text',
        seen: false,
      );
      messageRepository.sendMessage(
        newMessage,
        chatroomCtrl!.chatroomid.toString(),
      );
      ChatRoomModel chatroom = chatroomCtrl!.copyWith(
        idSender: getUidCurrentUser(),
        nameSender: currentUser.fullName,
        lastMessage:
            Optional.of(msg.length > 30 ? DisplayHelper.subString(msg) : msg),
        dateTime: DateTime.now(),
        seen: Optional.of(false),
      );
      roomChatRepository.updateLastMessage(chatroom);
    } else if (fileImage != null) {
      print('run send image');
      await uploadFile();
      clearFile();
      MessageModel newMessage = MessageModel(
        messageId: const Uuid().v1(),
        idSender: getUidCurrentUser(),
        dateTime: DateTime.now(),
        message: fileUrl.value,
        typeMessage: 'image',
        seen: false,
      );
      messageRepository.sendMessage(
          newMessage, chatroomCtrl!.chatroomid.toString());

      ChatRoomModel chatroom = chatroomCtrl!.copyWith(
        idSender: getUidCurrentUser(),
        seen: Optional.of(true),
        lastMessage:
            Optional.of("${currentUser.fullName} đã gửi một hình ảnh "),
        dateTime: DateTime.now(),
      );
      roomChatRepository.updateLastMessage(chatroom);
    }
  }

  void goToSearch() {
    Get.toNamed(Routes.SEARCH);
  }

  final profileRepository = Get.find<ProfileRepository>();
  final authRepository = Get.find<AuthRepository>();

  Future<void> logOut() async {
    authRepository.logout();
    Get.offAllNamed(Routes.LOGIN);
  }

  UploadTask? task;
  var fileNameFromComputer = RxString('');
  File? file;
  File? fileImage;
  var fileUrl = Rxn<String>('');

  // select file
  Future<void> selectFile() async {
    messTextCtrl.clear();
    print('run select file');
    final selectedFile =
        await FilePicker.platform.pickFiles(allowMultiple: false);
    if (selectedFile != null) {
      file = File(selectedFile.files.single.path!);
      update();
      final fileName = basename(file!.path);
      fileNameFromComputer.value = fileName;
      final destination = 'files/$fileName';
      task = chatRepository.uploadFile(destination, file!);
      update();
      if (task != null) {
        try {
          final snapshot = await task!.whenComplete(() {});
          final urlDownload = await snapshot.ref.getDownloadURL();
          fileUrl.value = urlDownload;
        } on FirebaseException catch (e) {
          printError(info: e.toString());
        }
      }
    }
  }

  Future<void> selectImageFromCamera() async {
    messTextCtrl.clear();
    final ImagePicker picker = ImagePicker();
    final selectedImage = await picker.pickImage(source: ImageSource.camera);
    if (selectedImage != null) {
      file = File(selectedImage.path);
      fileImage = file;
      update();
    }
  }

  Future<void> uploadFile() async {
    final fileName = basename(file!.path);
    final destination = 'files/$fileName';
    task = chatRepository.uploadFile(destination, file!);
    update();
    if (task != null) {
      try {
        final snapshot = await task!.whenComplete(() {});
        final urlDownload = await snapshot.ref.getDownloadURL();
        fileUrl.value = urlDownload;
      } on FirebaseException catch (e) {
        printError(info: e.toString());
      }
    }
  }

  void clearFile() {
    fileImage = null;
    file = null;
    update();
  }

  @override
  void dispose() {}
}
