import 'package:chat_app/app/modules/auth/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../gen/assets.gen.dart';
import '../../../core/utils/colors.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.whiteW50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: IconButton(
          icon: Assets.icons.icBack.svg(),
          onPressed: Get.back,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
          key: controller.formKeyRegister,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Register account',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: ColorConstants.inkI40,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: controller.validateEmail,
                      decoration: const InputDecoration(
                        label: Text('Email'),
                        hintText: 'Enter email',
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: controller.phoneNumberController,
                      keyboardType: TextInputType.phone,
                      validator: controller.validatePhoneNumber,
                      decoration: const InputDecoration(
                        label: Text('Phone number'),
                        hintText: 'Enter phone number',
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: controller.passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: !controller.visiablePassword.value,
                      validator: controller.validatePassword,
                      decoration: InputDecoration(
                        label: const Text('Password'),
                        hintText: 'Enter password',
                        suffixIcon: IconButton(
                          icon: controller.visiablePassword.value
                              ? Assets.icons.icEyeFill.svg()
                              : Assets.icons.icEyeClose.svg(),
                          onPressed: controller.setVisiablePassword,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: controller.rePasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: !controller.visiableRePassword.value,
                      validator: controller.validateRePassword,
                      decoration: InputDecoration(
                        label: const Text('Re-enter password'),
                        hintText: 'Re-enter password',
                        suffixIcon: IconButton(
                          icon: controller.visiableRePassword.value
                              ? Assets.icons.icEyeFill.svg()
                              : Assets.icons.icEyeClose.svg(),
                          onPressed: controller.setVisiableRePassword,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: controller.registerHandle,
                      child: Obx(
                        () => !controller.loading.value
                            ? Text(
                                'Register',
                                style:
                                    TextStyle(color: ColorConstants.whiteW50),
                              )
                            : CircularProgressIndicator(
                                color: ColorConstants.whiteW50,
                              ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'By clicking to Register, you agree to our ',
                    style: TextStyle(
                      color: ColorConstants.brandBlack,
                      fontSize: 14,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Term of Service ',
                        style: TextStyle(
                          color: ColorConstants.primaryRed,
                        ),
                      ),
                      const TextSpan(text: 'and you have read our '),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(
                          color: ColorConstants.primaryRed,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
