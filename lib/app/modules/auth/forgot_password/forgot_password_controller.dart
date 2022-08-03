import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/regex.dart';
import '../../../routes/app_pages.dart';

class ForgotPasswordController extends GetxController {
  final formKeyLogin = GlobalKey<FormState>();
  final emailCtrl = TextEditingController();
  final newPasswordCtrl = TextEditingController();
  final newConfirmPasswordCtrl = TextEditingController();

  bool visiableNewPassword = false;
  bool visiableNewConfirmPassword = false;

  final focus2 = FocusNode();
  final focus3 = FocusNode();
  final focus4 = FocusNode();
  final focus5 = FocusNode();
  final focus6 = FocusNode();

  void setVisiableNewPassword() {
    visiableNewPassword = !visiableNewPassword;
    update();
  }

  void setVisiableNewConfirmPassword() {
    visiableNewConfirmPassword = !visiableNewConfirmPassword;
    update();
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

  void goToEnterCode() {
    // request email to firesbase (check email)
    //do something
    Get.toNamed(Routes.ENTER_CODE_LOGIN);
  }

  void goToChangePassword() {
    //verify code ?
    Get.toNamed(Routes.CHANGE_PASSWORD);
  }

  //Next field
  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }
  }

  void updatePassword() {}

  @override
  void onClose() {
    super.onClose();
    emailCtrl.dispose();
    newPasswordCtrl.dispose();
    newConfirmPasswordCtrl.dispose();
    focus2.dispose();
    focus3.dispose();
    focus4.dispose();
    focus5.dispose();
    focus6.dispose();
  }
}
