import 'package:chat_app/app/modules/auth/forgot_password/forgot_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../gen/assets.gen.dart';
import '../../../core/utils/colors.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.whiteW50,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          color: ColorConstants.blackB90,
          onPressed: Get.back,
          icon: Assets.icons.icBackArrow.svg(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Forgot Password',
                  style: TextStyle(
                    color: ColorConstants.neutralN100,
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Please enter your email address to get code login and change password",
                  style: TextStyle(
                    height: 1.2,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: ColorConstants.neutralN100,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: controller.emailCtrl,
                  keyboardType: TextInputType.emailAddress,
                  validator: controller.validateEmail,
                  decoration: const InputDecoration(
                    label: Text('Email'),
                    hintText: 'Enter email',
                  ),
                ),
              ],
            ),
            ElevatedButton(
              // style: appStyle.elevatedButtonStyle,
              onPressed: controller.goToEnterCode,
              child: Text(
                'Get Code',
                style: TextStyle(color: ColorConstants.whiteW50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
