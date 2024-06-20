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

class EnterVerificationCodeController extends GetxController {

  TextEditingController verification_code = new TextEditingController();


  late SharedPreferences prefs;


  @override
  void onInit() async {
    super.onInit();

    prefs = await SharedPreferences.getInstance();

    if(prefs.getString('token') != null) {
      Get.offNamed(AppRoute.sendVerificationCode);
    } else {
      Get.offNamed(AppRoute.enterVerificationCode);
    }
  }





  void checkVerificationCode() async
  {
    User user = User(verificationCode: verification_code.value.text);
    String request_body = user.toJson();

    var post = await DioClient().getInstance().post(
        '/checkVerificationCode', data: request_body);

    if (post.statusCode == 200) {
      showSuccessDialog(
          Get.context!, "Correct",
          "Your verification code is correct! You may know change your password", () {
        prefs.setString('token', post.data['token']);
        Get.offNamed(AppRoute.enterVerificationCode);
      });
    }
  }


}