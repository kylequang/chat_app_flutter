import 'package:chat_app/app/modules/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../gen/assets.gen.dart';
import '../../core/utils/colors.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Profile',
          style: TextStyle(
            color: ColorConstants.blackB50,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
          key: controller.formKeyProfile,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: Image.asset(Assets.images.k.path),
                  )
                ],
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: controller.fullNameController,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Full name is required';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  label: Text('Fullname'),
                  hintText: 'Enter your full name',
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: controller.idNumberController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Id number is required';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  label: Text('Id number'),
                  hintText: 'Enter your ID number',
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: controller.birthdayController,
                readOnly: true,
                keyboardType: TextInputType.datetime,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Date Of Birth is required ';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  label: const Text('Date of birth'),
                  hintText: 'Enter your Date of Birth',
                  suffixIcon: IconButton(
                    icon: Assets.icons.icCalendar.svg(),
                    onPressed: controller.chooseDate,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: controller.genderController,
                readOnly: true,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Gender is required';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  label: const Text('Gender'),
                  hintText: 'Select gender',
                  suffixIcon: IconButton(
                    icon: Assets.icons.icCaretDown.svg(),
                    onPressed: controller.selectGender,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: controller.emailProfileController,
                keyboardType: TextInputType.emailAddress,
                readOnly: true,
                validator: controller.validateEmail,
                decoration: const InputDecoration(
                  label: Text('Email'),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: controller.provinceController,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Province or city is required';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  label: Text('Province City'),
                  hintText: 'Your province city',
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: controller.districtController,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'District is required';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  label: Text('District'),
                  hintText: 'Your district',
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: controller.addressController,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Address is required';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  label: Text('Address'),
                  hintText: 'Your address',
                ),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: controller.createUser,
                      child: Obx(
                        () => !controller.loading.value!
                            ? Text(
                                'Save',
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
            ],
          ),
        ),
      ),
    );
  }
}
