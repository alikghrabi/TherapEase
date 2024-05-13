import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:therapease/Models/User.dart';
import '../Core/Network/DioClient.dart';
import '../Routes/AppRoute.dart';


class ProfileController extends GetxController {

  late SharedPreferences prefs;
  User? user; // Declare as nullable


  @override
  void onInit() async {
    super.onInit();

    prefs = await SharedPreferences.getInstance();

    if(prefs.getString('token') != null) {
      Get.offNamed(AppRoute.profile);
      fetchUserInfo();
    } else {
      Get.offNamed(AppRoute.login);
    }

  }

  void logout() {
    prefs.remove("token");
    Get.offNamed(AppRoute.login);
  }

  void fetchUserInfo () async {

    var response = await DioClient().getInstance().get("/user");

    if (response.statusCode == 200) {
      user = User.fromJson(response.data);
      update();
    }
  }

}