import 'package:chat_app/app/data/repository/chat_repository.dart';
import 'package:chat_app/app/data/repository/message_repository.dart';
import 'package:chat_app/app/data/repository/room_chat_repository.dart';
import 'package:chat_app/app/data/repository/users_repository.dart';
import 'package:get/get.dart';
import '../data/repository/auth_repository.dart';
import '../data/repository/profile_repository.dart';

class RepositoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(),
      fenix: true,
    );
    Get.lazyPut<ProfileRepository>(
      () => ProfileRepositoryImpl(),
      fenix: true,
    );
    Get.lazyPut<UsersRepository>(
      () => UsersRepositoryImpl(),
      fenix: true,
    );
    Get.lazyPut<ChatRepository>(
      () => ChatRepositoryImpl(),
      fenix: true,
    );
    Get.lazyPut<RoomChatRepository>(
      () => RoomChatRepositoryImpl(),
      fenix: true,
    );
    Get.lazyPut<MessageRepository>(
      () => MessageRepositoryImpl(),
      fenix: true,
    );
  }
}
