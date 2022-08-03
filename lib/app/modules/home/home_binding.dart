import 'package:chat_app/app/modules/account/account_controller.dart';
import 'package:chat_app/app/modules/chats/chat_controller.dart';
import 'package:chat_app/app/modules/home/home_controller.dart';
import 'package:chat_app/app/modules/users/users_controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => UsersController());
    Get.lazyPut(() => AccountController());
    Get.lazyPut(() => ChatController());
  }
}
