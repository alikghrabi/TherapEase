import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Routes/AppRoute.dart';



class TherapistHomeController extends GetxController {


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

  void logout() {
    prefs.remove("token");
    prefs.remove("user_id");
    Get.offAllNamed(AppRoute.login);
  }
}