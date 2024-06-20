import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Core/Network/DioClient.dart';
import '../Core/showSuccessDialog.dart';
import '../Models/User.dart';
import '../Routes/AppRoute.dart';

class SendVerificationCodeController extends GetxController {

  TextEditingController email = new TextEditingController();


  late SharedPreferences prefs;


  @override
  void onInit() async {
    super.onInit();

    prefs = await SharedPreferences.getInstance();
  }




  void sendVerificationCode() async
  {
    User user = User(email: email.value.text);
    String request_body = user.toJson();

    var post = await DioClient().getInstance().post(
        '/sendVerificationCode', data: request_body);

    if (post.statusCode == 200) {
      showSuccessDialog(
          Get.context!, "Verification Code Sent",
          "A verification code has been sent to '${user.email}'", () {
        prefs.setString('token', post.data['token']);
        Get.offNamed(AppRoute.enterVerificationCode);
      });
    }
  }
}