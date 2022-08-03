import 'package:chat_app/app/core/widgets/status_dialog_widget.dart';
import 'package:chat_app/app/data/repository/auth_repository.dart';
import 'package:chat_app/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/enum/firebase_error_type.dart';
import '../../../core/enum/status_dialog_type.dart';
import '../../../core/utils/regex.dart';

class RegisterController extends GetxController {
  final authRepository = Get.find<AuthRepository>();
  // formKey
  final formKeyRegister = GlobalKey<FormState>();

  // textEditingController
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final rePasswordController = TextEditingController();

  RxBool visiablePassword = false.obs;
  void setVisiablePassword() {
    visiablePassword.value = !visiablePassword.value;
  }

  RxBool visiableRePassword = false.obs;
  void setVisiableRePassword() {
    visiableRePassword.value = !visiableRePassword.value;
  }

  RxBool loading = RxBool(false);
  // validate
  String? validateEmail(String? value) {
    if (value!.isEmpty) {
      return 'Email is required';
    }
    if (!Regex.isEmail(value)) {
      return 'Email is not valid';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  String? validateRePassword(String? value) {
    if (value!.isEmpty) {
      return 'Re-enter password is required';
    }
    if (value != passwordController.text) {
      return 'Re-password does not match Password';
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value!.isEmpty) {
      return 'Phone number is required';
    }
    if (!Regex.isPhoneNumber(value)) {
      return 'Phone number format error';
    }
    return null;
  }

  // call firebase api
  Future<void> registerHandle() async {
    if (formKeyRegister.currentState!.validate()) {
      try {
        await authRepository.register(
          emailController.text.trim(),
          passwordController.text.trim(),
        );

        Get.dialog(
          StatusDialogWidget(
            dialogTitle: "Create Account Successfully",
            description: "Account was created. You can login app!",
            dialogType: StatusDialogType.success.status,
            onTap: () => Get.offAllNamed(Routes.LOGIN),
          ),
          barrierDismissible: false,
        );
      } on FirebaseAuthException catch (e) {
        if (e.code == FirebaseErrorType.emailAlreadyInUse.code) {
          Get.dialog(
            StatusDialogWidget(
              dialogTitle: "Create Account Failed",
              description: "The account already exists for that email.",
              dialogType: StatusDialogType.error.status,
              onTap: Get.back,
            ),
            barrierDismissible: false,
          );
        }
      }
    }
  }
}
