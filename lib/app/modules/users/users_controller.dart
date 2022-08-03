import 'package:chat_app/app/data/models/index.dart';
import 'package:chat_app/app/data/repository/users_repository.dart';
import 'package:get/get.dart';
import '../../routes/app_pages.dart';

class UsersController extends GetxController {
  RxString uidOfCurrentUser = RxString('');
  final userRepo = Get.find<UsersRepository>();

  @override
  void onInit() async {
    super.onInit();
    uidOfCurrentUser.value = userRepo.getUidOfCurrentUser();
  }

  void goToChatDetail(UsersModel user) async {
    Get.toNamed(Routes.CHAT_DETAIL, arguments: user);
  }
}
