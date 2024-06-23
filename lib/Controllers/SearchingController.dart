import 'dart:js_util';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:therapease/Models/User.dart';
import '../Core/Network/DioClient.dart';
import '../Routes/AppRoute.dart';



class SearchingController extends GetxController {

  late SharedPreferences prefs;

  @override
  void onInit() async {
    super.onInit();

    prefs = await SharedPreferences.getInstance();

    if(prefs.getString('token') != null) {
      Get.offNamed(AppRoute.search);
    } else {
      Get.offNamed(AppRoute.login);
    }

  }

  void logout() {
    prefs.remove("token");
    prefs.remove("user_id");
    Get.offAllNamed(AppRoute.login);
  }

}