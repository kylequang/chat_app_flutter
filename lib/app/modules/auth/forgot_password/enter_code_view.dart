import 'package:chat_app/app/modules/auth/forgot_password/forgot_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../gen/assets.gen.dart';
import '../../../core/utils/colors.dart';

class EnterCodeView extends GetView<ForgotPasswordController> {
  const EnterCodeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.whiteW50,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
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
                  'Code Login',
                  style: TextStyle(
                    color: ColorConstants.neutralN100,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "A code has been sent to your email, please check your mailbox",
                  style: TextStyle(
                    height: 1.2,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: ColorConstants.neutralN100,
                  ),
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 22),
                        keyboardType: TextInputType.number,
                        autofocus: true,
                        onChanged: (value) {
                          controller.nextField(value, controller.focus2);
                        },
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 15),
                        ),
                      ),
                    ),
                    const VerticalDivider(width: 10),
                    Expanded(
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 22),
                        keyboardType: TextInputType.number,
                        focusNode: controller.focus2,
                        onChanged: (value) {
                          controller.nextField(value, controller.focus3);
                        },
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 15),
                        ),
                      ),
                    ),
                    const VerticalDivider(width: 10),
                    Expanded(
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 22),
                        keyboardType: TextInputType.number,
                        focusNode: controller.focus3,
                        onChanged: (value) {
                          controller.nextField(value, controller.focus4);
                        },
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 15),
                        ),
                      ),
                    ),
                    const VerticalDivider(width: 10),
                    Expanded(
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 22),
                        keyboardType: TextInputType.number,
                        focusNode: controller.focus4,
                        onChanged: (value) {
                          controller.nextField(value, controller.focus5);
                        },
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 15),
                        ),
                      ),
                    ),
                    const VerticalDivider(width: 10),
                    Expanded(
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 22),
                        keyboardType: TextInputType.number,
                        focusNode: controller.focus5,
                        onChanged: (value) {
                          controller.nextField(value, controller.focus6);
                        },
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 15),
                        ),
                      ),
                    ),
                    const VerticalDivider(width: 10),
                    Expanded(
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 22),
                        keyboardType: TextInputType.number,
                        focusNode: controller.focus6,
                        onChanged: (value) => controller.focus6.unfocus(),
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 15),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Haven't received the code?",
                      style: TextStyle(
                        fontSize: 16,
                        color: ColorConstants.mainL2,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Send it again",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: ColorConstants.primaryRed,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            ElevatedButton(
              onPressed: controller.goToChangePassword,
              child: Text(
                'Login',
                style: TextStyle(color: ColorConstants.whiteW50),
              ),
            )
          ],
        ),
      ),
    );
  }
}
