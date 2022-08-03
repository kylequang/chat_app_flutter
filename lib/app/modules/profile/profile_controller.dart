import 'dart:io';

import 'package:chat_app/app/data/models/index.dart';
import 'package:chat_app/app/modules/profile/widgets/gender_list_bottom_sheet_widget.dart';
import 'package:chat_app/app/modules/profile/widgets/select_gender_dropdown.dart';
import 'package:chat_app/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../core/utils/regex.dart';
import '../../data/repository/profile_repository.dart';

class ProfileController extends GetxController {
  final profileRepository = Get.find<ProfileRepository>();
  // formKey
  final formKeyProfile = GlobalKey<FormState>();

  // textEditingController
  final fullNameController = TextEditingController();
  final idNumberController = TextEditingController();
  final birthdayController = TextEditingController();
  final genderController = TextEditingController();
  final emailProfileController = TextEditingController();
  var phoneNumber = '';
  final provinceController = TextEditingController();
  final districtController = TextEditingController();
  final addressController = TextEditingController();

  User user = FirebaseAuth.instance.currentUser!;
  @override
  void onReady() {
    emailProfileController.text = user.email!;
    super.onReady();
  }

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

  var selectedDate = DateTime.now().obs;
  void chooseDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: selectedDate.value,
      firstDate: DateTime(1990),
      lastDate: DateTime(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
      ),
    );
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
      birthdayController.text =
          DateFormat("dd/MM/yyyy").format(selectedDate.value).toString();
    }
  }

  void selectGender() {
    List<Map<String, String>> gender() => [
          {'text': 'Male', 'value': 'Male'},
          {
            'text': 'Female',
            'value': 'Female',
          }
        ];

    List<IItemSelectDropdown> data = gender()
        .map<IItemSelectDropdown>(
          (dynamic e) => IItemSelectDropdown(
            id: e['value'],
            name: e['text'],
          ),
        )
        .toList();
    Get.bottomSheet(
      GenderListBottomSheetWidget(data: data),
    );
  }

  var loading = Rxn<bool>(false);
  Future<void> createUser() async {
    if (formKeyProfile.currentState!.validate()) {
      loading.value = true;
      addUser();
    }
  }

  File? fileImage;
  Future<void> selectImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    final selectedImage = await picker.pickImage(source: ImageSource.camera);
    if (selectedImage != null) {
      fileImage = File(selectedImage.path);
    }
  }

  Future<void> addUser() async {
    String avatar =
        'https://img.freepik.com/premium-vector/cute-white-cat-cartoon-vector-illustration_42750-808.jpg?w=2000';
    await profileRepository.addUserWithID(
      UsersModel(
        id: user.uid,
        email: user.email!,
        phoneNumber: phoneNumber,
        idNumber: idNumberController.text.trim(),
        fullName: fullNameController.text.trim(),
        dateOfBirth: birthdayController.text.trim(),
        gender: genderController.text.trim(),
        provinceOrCity: provinceController.text.trim(),
        district: districtController.text.trim(),
        address: addressController.text.trim(),
        avatar: avatar,
        uid: user.uid,
      ),
      user.uid,
    );
    Get.offAllNamed(Routes.HOME);
  }
}
