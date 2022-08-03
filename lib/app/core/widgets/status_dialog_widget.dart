import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../gen/assets.gen.dart';
import '../enum/status_dialog_type.dart';
import '../utils/colors.dart';

class StatusDialogWidget extends StatelessWidget {
  final String dialogTitle;
  final String description;
  final String dialogType;
  final String? primaryBtn;
  final Function()? onTap;
  const StatusDialogWidget({
    Key? key,
    required this.dialogTitle,
    required this.description,
    required this.dialogType,
    this.onTap,
    this.primaryBtn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        margin: const EdgeInsets.only(top: 70),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width - 45,
              child: dialogType == StatusDialogType.success.status
                  ? Assets.images.success.svg(
                      width: 80,
                      height: 80,
                    )
                  : Assets.images.error.svg(
                      width: 80,
                      height: 80,
                    ),
            ),
            const SizedBox(height: 15),
            Text(
              dialogTitle,
              style: TextStyle(
                fontSize: 20,
                color: dialogType == StatusDialogType.success.status
                    ? Colors.green
                    : Colors.red,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                description,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 15),
            if (dialogType == StatusDialogType.success.status)
              ElevatedButton(
                onPressed: onTap,
                child: Text(
                  primaryBtn ?? '',
                  style: TextStyle(
                    color: ColorConstants.whiteW50,
                    fontSize: 12,
                  ),
                ),
              ),
            if (dialogType == StatusDialogType.error.status)
              ElevatedButton(
                onPressed: Get.back,
                child: Text(
                  'Close',
                  style: TextStyle(
                    color: ColorConstants.whiteW50,
                    fontSize: 12,
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
