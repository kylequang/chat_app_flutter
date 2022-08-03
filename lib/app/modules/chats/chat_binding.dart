import 'package:chat_app/app/modules/chats/chat_controller.dart';
import 'package:get/get.dart';

class ChatBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(
      () => ChatController(),
      fenix: true,
    );
  }
}
