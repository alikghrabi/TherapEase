import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:therapease/Models/User.dart';
import '../Core/Network/DioClient.dart';
import '../Core/showSuccessDialog.dart';
import '../Routes/AppRoute.dart';



class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  late SharedPreferences prefs;

  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();

    prefs = await SharedPreferences.getInstance();

    if(prefs.getString('token') != null) {
      Get.offNamed(AppRoute.home);
    } else {
      Get.offNamed(AppRoute.login);
    }
  }

  void login () async {
    User user = User(email:email.value.text, password:password.value.text);
    String request_body = user.toJson();

    var post = await DioClient().getInstance().post("/login", data: request_body);

    if (post.statusCode == 200) {
      showSuccessDialog(
          Get.context!, "Login Success", "Welcome Back!", () {
        prefs.setString('token', post.data['token']);
        Get.offNamed(AppRoute.home);
      });
    }
  }
}