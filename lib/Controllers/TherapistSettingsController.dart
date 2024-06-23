import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:therapease/Models/User.dart';
import '../Core/Network/DioClient.dart';
import '../Models/Therapist.dart';
import '../Routes/AppRoute.dart';
import 'package:http/http.dart' as http;

class TherapistSettingsController extends GetxController {
  late SharedPreferences prefs;


  @override
  void onInit() async {
    super.onInit();
    prefs = await SharedPreferences.getInstance();

    if (prefs.getString('token') == null ||
        prefs.getInt('therapist_id') == null) {
      Get.offNamed(AppRoute.therapistLogin);
    }
  }

  void logout() {
    prefs.remove("token");
    prefs.remove("therapist_id");
    Get.offAllNamed(
        AppRoute.therapistLogin); // Use Get.offAllNamed to clear navigation stack
  }

}
