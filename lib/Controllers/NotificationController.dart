import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Routes/AppRoute.dart';

class NotificationController extends GetxController {

  late SharedPreferences prefs;


  @override
  void onInit() async {
    super.onInit();

    prefs = await SharedPreferences.getInstance();

    if(prefs.getString('token') != null) {
      Get.offNamed(AppRoute.account);
    } else {
      Get.offNamed(AppRoute.login);
    }

  }

  void logout() {
    prefs.remove("token");
    Get.offNamed(AppRoute.login);
  }

}