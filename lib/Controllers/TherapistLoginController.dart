import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:therapease/Models/User.dart';
import '../Core/Network/DioClient.dart';
import '../Core/showSuccessDialog.dart';
import '../Models/Therapist.dart';
import '../Routes/AppRoute.dart';

class TherapistLoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  late SharedPreferences prefs;

  @override
  void onInit() {
    super.onInit();
    initializePreferences();
  }

  void initializePreferences() async {
    prefs = await SharedPreferences.getInstance();

    if (prefs.getString('token') != null) {
      Get.offNamed(AppRoute.therapistHome);
    } else {
      Get.offNamed(AppRoute.therapistLogin);
    }
  }

  void login() async {
    Therapist therapist = Therapist(email: email.value.text, password: password.value.text);
    String requestBody = therapist.toJson();

    try {
      var post = await DioClient().getInstance().post("/loginTherapist", data: requestBody);

      if (post.statusCode == 200 && post.data['status']) {
        String token = post.data['token'];
        int therapistId = post.data['therapist']['id'];

        await prefs.setString('token', token);
        await prefs.setInt('therapist_id', therapistId);

        showSuccessDialog(
          Get.context!,
          "Login Success",
          "Welcome Back!",
              () {
            Get.offNamed(AppRoute.therapistHome);
          },
        );
      } else {
        showErrorDialog();
      }
    } catch (e) {
      print('Error during login: $e');
      showErrorDialog();
    }
  }

  void showErrorDialog() {
    showSuccessDialog(
      Get.context!,
      "Invalid",
      "Invalid email or password",
          () {},
    );
  }
}
