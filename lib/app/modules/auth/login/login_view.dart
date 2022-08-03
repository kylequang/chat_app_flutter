import 'package:chat_app/app/core/utils/colors.dart';
import 'package:chat_app/app/modules/auth/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../gen/assets.gen.dart';
import '../../../routes/app_pages.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.whiteW50,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: controller.formKeyLogin,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 60),
              Image.asset(
                Assets.images.chatAppLogo.path,
                height: 200,
              ),
              const SizedBox(height: 20),
              const Text(
                'Welcome to Chat App K',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                'Login to user ChatApp K',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              Obx(
                () => controller.errorLogin.value
                    ? Container(
                        margin: const EdgeInsets.only(top: 24, bottom: 16),
                        decoration: BoxDecoration(
                          color: ColorConstants.redR05,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(width: 12),
                            Assets.icons.icError.svg(),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: controller.errorContentLogin.value
                                                .length >
                                            30
                                        ? 16
                                        : 4),
                                child: Text(
                                  controller.errorContentLogin.value,
                                  style: TextStyle(
                                    color: ColorConstants.blackB50,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Assets.icons.icClose.svg(),
                              onPressed: controller.hideErrorLogin,
                              iconSize: 14,
                            )
                          ],
                        ),
                      )
                    : const SizedBox(height: 40),
              ),
              TextFormField(
                controller: controller.emailCtrl,
                keyboardType: TextInputType.emailAddress,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: controller.validateEmail,
                decoration: const InputDecoration(
                  label: Text('Email'),
                  hintText: 'Enter email',
                ),
              ),
              const SizedBox(height: 16),
              Obx(
                () => TextFormField(
                  controller: controller.passwordCtrl,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: !controller.visiablePassword.value,
                  validator: controller.validatePassword,
                  decoration: InputDecoration(
                    label: const Text('Password'),
                    hintText: 'Enter Password',
                    suffixIcon: IconButton(
                      icon: controller.visiablePassword.value
                          ? Assets.icons.icEyeFill.svg()
                          : Assets.icons.icEyeClose.svg(),
                      onPressed: controller.setVisiablePassword,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  style: TextButton.styleFrom(
                    visualDensity: VisualDensity.compact,
                  ),
                  onPressed: () => Get.toNamed(Routes.FORGOT_PASSWORD),
                  child: const Text(
                    'Forgot password',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: controller.loginApp,
                child: Text(
                  'Login',
                  style: TextStyle(color: ColorConstants.whiteW50),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account? "),
                  TextButton(
                    onPressed: () => Get.toNamed(Routes.REGISTER),
                    child: const Text('Register'),
                  )
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Or login with',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: ColorConstants.primaryBlue10,
                    child: IconButton(
                      icon: Assets.icons.icFacebook.svg(),
                      onPressed: () => Get.toNamed(Routes.TEST),
                    ),
                  ),
                  const SizedBox(width: 16),
                  CircleAvatar(
                    backgroundColor: ColorConstants.redR05,
                    child: Assets.icons.icGoogle.svg(),
                  ),
                  const SizedBox(width: 16),
                  CircleAvatar(
                    backgroundColor: ColorConstants.blackB10,
                    child: Assets.icons.icApple.svg(),
                  ),
                ],
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
