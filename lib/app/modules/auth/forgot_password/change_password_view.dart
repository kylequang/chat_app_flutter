import 'package:chat_app/app/modules/auth/forgot_password/forgot_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../gen/assets.gen.dart';
import '../../../core/utils/colors.dart';

class ChangePasswordView extends GetView<ForgotPasswordController> {
  const ChangePasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.whiteW50,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          color: ColorConstants.blackB90,
          onPressed: Get.back,
          icon: Assets.icons.icBackArrow.svg(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Change Password',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: ColorConstants.neutralN100,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Enter new password',
                  style: TextStyle(
                    height: 1.2,
                    fontSize: 16,
                    color: ColorConstants.neutralN100,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: controller.newPasswordCtrl,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: !controller.visiableNewPassword,
                  validator: controller.validatePassword,
                  decoration: InputDecoration(
                    label: const Text('New password'),
                    hintText: 'Enter new password',
                    suffixIcon: controller.visiableNewPassword
                        ? IconButton(
                            icon: Assets.icons.icEyeFill.svg(),
                            onPressed: controller.setVisiableNewPassword,
                          )
                        : IconButton(
                            icon: Assets.icons.icEyeClose.svg(),
                            onPressed: controller.setVisiableNewPassword,
                          ),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: controller.newConfirmPasswordCtrl,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: !controller.visiableNewConfirmPassword,
                  validator: controller.validatePassword,
                  decoration: InputDecoration(
                    label: const Text('Confirm new password'),
                    hintText: 'Confirm new password',
                    suffixIcon: controller.visiableNewConfirmPassword
                        ? IconButton(
                            icon: Assets.icons.icEyeFill.svg(),
                            onPressed: controller.setVisiableNewConfirmPassword,
                          )
                        : IconButton(
                            icon: Assets.icons.icEyeClose.svg(),
                            onPressed: controller.setVisiableNewConfirmPassword,
                          ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: controller.updatePassword,
              child: Text(
                'Save',
                style: TextStyle(color: ColorConstants.whiteW50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
