import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Core/Network/DioClient.dart';
import '../Core/showSuccessDialog.dart';
import '../Models/Therapist.dart';
import '../Routes/AppRoute.dart';

class TherapistRegisterController extends GetxController {
  var name = TextEditingController();
  var email = TextEditingController();
  var phone = TextEditingController();
  var password = TextEditingController();
  var experience = TextEditingController();
  var description = TextEditingController();


  var cvFile = Rx<File?>(null);
  var image1 = Rx<File?>(null);
  var image2 = Rx<File?>(null);

  final ImagePicker _picker = ImagePicker(); // Ensure this is correctly defined

  late SharedPreferences prefs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();

    prefs = await SharedPreferences.getInstance();
  }

  void pickCvFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null && result.files.single.path != null) {
      cvFile.value = File(result.files.single.path!);
    }
  }

  void pickImage1() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      image1.value = File(pickedFile.path);
    }
  }

  void pickImage2() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      image2.value = File(pickedFile.path);
    }
  }


  bool checkFields() {
    if (name.text.isEmpty) {
      showSuccessDialog(
          Get.context!, "Error", "Full Name is required", () {
      });
      return false;
    } else if (phone.text.isEmpty) {
      showSuccessDialog(
          Get.context!, "Error", "Phone Number is required", () {
      });
      return false;
    } else if (email.text.isEmpty) {
      showSuccessDialog(
          Get.context!, "Error", "Email is required", () {
      });
      return false;
    } else if (password.text.isEmpty) {
      showSuccessDialog(
          Get.context!, "Error", "Password is required", () {
      });
      return false;
    } else if (cvFile.value == null) {
      showSuccessDialog(
          Get.context!, "Error", "CV (PDF) is required", () {
      });
      return false;
    } else if (image1.value == null) {
      showSuccessDialog(
          Get.context!, "Error", "Image 1 is required", () {
      });
      return false;
    } else if (image2.value == null) {
      showSuccessDialog(
          Get.context!, "Error", "Image 2 is required", () {
      });
      return false;
    }
    return true;
  }

  void register() async {
    if (checkFields()) {
      Therapist therapist = Therapist(
          name: name.value.text,
          email: email.value.text,
          phone: phone.value.text,
          password: password.value.text,
          experience: int.tryParse(experience.value.text),
          descriptionRegistration: description.value.text,
          nationalIdPicFrontSide: image1.value?.path,
          nationalIdPicBackSide: image2.value?.path);

      String request_body = therapist.toJson();

      var post = await DioClient().getInstance().post(
          '/registerTherapist', data: request_body);

      if (post.statusCode == 200) {
        showSuccessDialog(
            Get.context!, "Success", "Your application has been received! Keep checking ur email for updates on your application.", () {
          prefs.setString('token', post.data['token']);
          Get.offNamed(AppRoute.home);
        });
      }
    }
  }
}