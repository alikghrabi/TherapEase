import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Core/Network/DioClient.dart';
import '../Core/showSuccessDialog.dart';
import '../Models/User.dart';
import '../Routes/AppRoute.dart';

class ChangeForgottenPasswordController extends GetxController {
  TextEditingController newPassword = TextEditingController();
  TextEditingController retypePassword = TextEditingController();

  late SharedPreferences prefs;


  @override
  void onInit() async {
    super.onInit();

    prefs = await SharedPreferences.getInstance();

    if(prefs.getString('token') != null) {
      Get.offNamed(AppRoute.changeForgottenPassword);
    } else {
      Get.offNamed(AppRoute.sendVerificationCode);
    }
  }

  bool checkFields() {
      if (newPassword.text.isEmpty) {
      showSuccessDialog(
          Get.context!, "Error", "Phone Number is required", () {
      });
      return false;
    } else if (retypePassword.text.isEmpty) {
      showSuccessDialog(
          Get.context!, "Error", "Email is required", () {
      });
      return false;
    } else if (newPassword.text != retypePassword.text) {
      showSuccessDialog(
          Get.context!, "Error", "New password and retype password don't match", () {
      });
      return false;
    }
    return true;
  }



  void changePassword() async {
    if (checkFields()) {
      User user = User(password: newPassword.value.text);
      String requestbody = user.toJson();
      var post = await DioClient().getInstance().post(
          "/changePassword", data: requestbody);
      if (post.statusCode == 200) {
        showSuccessDialog(
            Get.context!, "Success",
            "Your password has been changed successfully!", () {
          ();
        });
        Get.offNamed(AppRoute.login);
      } else {
        showSuccessDialog(
            Get.context!, "Error",
            "Error changing your password. Please try again", () {});
      }
    }
  }



  void goBack() {
    prefs.remove("token");
    Get.offNamed(AppRoute.login);
  }

}