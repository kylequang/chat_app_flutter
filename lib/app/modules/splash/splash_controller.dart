import 'package:chat_app/app/data/repository/profile_repository.dart';
import 'package:chat_app/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final profileRepository = Get.find<ProfileRepository>();
  @override
  void onReady() async {
    super.onReady();

    if (FirebaseAuth.instance.currentUser?.uid != null) {
      getCurrentUserFromApi();
    } else {
      Get.toNamed(Routes.LOGIN);
    }
  }

  Future<void> getCurrentUserFromApi() async {
    User user = FirebaseAuth.instance.currentUser!;
    final result = await profileRepository.checkIfDocExists(user.uid);
    if (result != true) {
      Get.toNamed(Routes.PROFILE);
    } else {
      Get.offNamed(Routes.HOME);
    }
  }
}
