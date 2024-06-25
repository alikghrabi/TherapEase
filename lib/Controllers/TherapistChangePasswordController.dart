import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Core/Network/DioClient.dart';
import '../Core/showSuccessDialog.dart';
import '../Models/User.dart';
import '../Routes/AppRoute.dart';

class TherapistChangePasswordController extends GetxController {
  TextEditingController currentPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController retypePassword = TextEditingController();

  late SharedPreferences prefs;

  @override
  void onInit() async {
    super.onInit();
    prefs = await SharedPreferences.getInstance();

    // Ensure user is logged in before accessing changePassword page
    if (prefs.getString('token') == null) {
      Get.offNamed(AppRoute.therapistLogin);
    }
  }

  bool checkFields() {
    if (currentPassword.text.isEmpty ||
        newPassword.text.isEmpty ||
        retypePassword.text.isEmpty) {
      showSuccessDialog(Get.context!, "Error", "All fields are required", () {});
      return false;
    } else if (newPassword.text != retypePassword.text) {
      showSuccessDialog(Get.context!, "Error", "New passwords do not match", () {});
      return false;
    } else if (newPassword.text == currentPassword.text) {
      showSuccessDialog(Get.context!, "Error", "New password must be different from current password", () {});
      return false;
    }
    return true;
  }

  void changePassword() async {
    if (checkFields()) {


      try {
        var dio = DioClient().getInstance();

        // Retrieve token from SharedPreferences
        var token = await getToken();

        // Set Authorization header
        dio.options.headers['Authorization'] = 'Bearer $token';
        dio.options.headers['Content-Type'] = 'application/json';

        var response = await dio.post(
          "/changePassword/${prefs.getInt('therapist_id')}",
          data: { "current_password": currentPassword.value.text, "new_password": newPassword.value.text, "retype_password": retypePassword.value.text },
        );

        if (response.statusCode == 200) {
          showSuccessDialog(
            Get.context!,
            "Success",
            "Your password has been changed successfully!",
                () {},
          );
        } else {
          showSuccessDialog(
            Get.context!,
            "Error",
            "Error changing your password. Please try again",
                () {},
          );
        }
      } catch (e) {
        print("Error: $e");
        showSuccessDialog(
          Get.context!,
          "Error",
          "Error changing your password. Please try again",
              () {},
        );
      }
    }
  }

  Future<String> getToken() async {
    return prefs.getString('token') ?? '';
  }

  void logout() {
    prefs.remove("token");
    prefs.remove("therapist_id");
    Get.offAllNamed(AppRoute.therapistLogin);
  }
}
