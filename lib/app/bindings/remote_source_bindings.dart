import 'package:chat_app/app/data/remote/chat_data_source.dart';
import 'package:chat_app/app/data/remote/message_data_source.dart';
import 'package:chat_app/app/data/remote/room_chat_data_source.dart';
import 'package:chat_app/app/data/remote/users_data_source.dart';
import 'package:get/get.dart';
import '../data/remote/auth_data_source.dart';
import '../data/remote/profile_data_source.dart';

class RemoteSourceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthDataSource>(
      () => AuthDataSourceImpl(),
      fenix: true,
    );
    Get.lazyPut<ProfileDataSource>(
      () => ProfileDataSourceImpl(),
      fenix: true,
    );
    Get.lazyPut<UsersDataSource>(
      () => UsersDataSourceImpl(),
      fenix: true,
    );
    Get.lazyPut<ChatDataSource>(
      () => ChatDataSourceImpl(),
      fenix: true,
    );
    Get.lazyPut<RoomChatDataSource>(
      () => RoomChatDataSourceImpl(),
      fenix: true,
    );
    Get.lazyPut<MessageDataSource>(
      () => MessageDataSourceImpl(),
      fenix: true,
    );
  }
}
