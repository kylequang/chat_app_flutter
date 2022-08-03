import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/enum/firebase_error_type.dart';
import '../../../core/utils/regex.dart';
import '../../../data/repository/auth_repository.dart';
import '../../../data/repository/profile_repository.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final authRepository = Get.find<AuthRepository>();
  final profileRepository = Get.find<ProfileRepository>();
  final formKeyLogin = GlobalKey<FormState>();
  var errorLogin = RxBool(false);
  var errorContentLogin = RxString('');
  RxBool visiablePassword = false.obs;
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  void setVisiablePassword() {
    visiablePassword.value = !visiablePassword.value;
  }

  void hideErrorLogin() {
    errorLogin.value = false;
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!Regex.isEmail(value)) {
      return 'Email is not valid';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    // if (!Regex.validatePassword(value)) {
    //   return "Password isn't valid";
    // }
    return null;
  }

  Future<void> loginApp() async {
    if (formKeyLogin.currentState!.validate()) {
      try {
        await authRepository.login(emailCtrl.text, passwordCtrl.text);
        await getUserFromApi();
      } on FirebaseAuthException catch (e) {
        if (e.code == FirebaseErrorType.userNotFound.code) {
          errorContentLogin.value = "No user found for that email.";
          errorLogin.value = true;
        } else if (e.code == FirebaseErrorType.wrongPassword.code) {
          errorContentLogin.value = "Wrong password provided.";
          errorLogin.value = true;
        }
      }
    }
  }

  Future<void> getUserFromApi() async {
    User user = FirebaseAuth.instance.currentUser!;
    final result = await profileRepository.checkIfDocExists(user.uid);
    if (result != true) {
      Get.toNamed(Routes.PROFILE);
    } else {
      Get.offNamed(Routes.HOME);
    }
  }
}
