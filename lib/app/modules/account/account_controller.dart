import 'package:chat_app/app/data/models/index.dart';
import 'package:chat_app/app/data/repository/users_repository.dart';
import 'package:get/get.dart';
import '../../data/repository/auth_repository.dart';
import '../../routes/app_pages.dart';

class AccountController extends GetxController {
  final authRepository = Get.find<AuthRepository>();

  final usersRepo = Get.find<UsersRepository>();

  @override
  void onInit() async {
    UsersModel? user =
        await usersRepo.getUserByUid(usersRepo.getUidOfCurrentUser());
    if (user != null) {
      print("=============");
      print(user.toJson());
    }
    super.onInit();
  }

  Future<void> logOut() async {
    authRepository.logout();
    Get.offAllNamed(Routes.LOGIN);
  }
}
