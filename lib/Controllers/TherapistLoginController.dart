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
  void onInit() async{
    // TODO: implement onInit
    super.onInit();

    prefs = await SharedPreferences.getInstance();

    if(prefs.getString('token') != null) {
      Get.offNamed(AppRoute.therapistHome);
    } else {
      Get.offNamed(AppRoute.therapistLogin);
    }
  }

  void login () async {
    Therapist therapist = Therapist(email:email.value.text, password:password.value.text);
    String request_body = therapist.toJson();

    var post = await DioClient().getInstance().post("/loginTherapist", data: request_body);

    if (post.statusCode == 200) {
      String token = post.data['token'];
      int therapistId = post.data['therapist']['id'];

      await prefs.setString('token', token);
      await prefs.setInt('user_id', therapistId);

      showSuccessDialog(
          Get.context!, "Login Success", "Welcome Back!", () {
        Get.offNamed(AppRoute.therapistHome);
      });
    } else {
      showSuccessDialog(
        Get.context!,
        "Invalid",
        "Invalid email or password",
            () {
        },
      );
    }
  }
}