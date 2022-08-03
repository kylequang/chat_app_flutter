import 'package:chat_app/app/modules/users/users_controller.dart';
import 'package:get/get.dart';

class UsersBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UsersController());
   
  }
}
