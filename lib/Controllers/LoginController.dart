import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
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
  void onInit() async {
    super.onInit();
    prefs = await SharedPreferences.getInstance();

    if (prefs.getString('token') != null) {
      Get.offNamed(AppRoute.home);
    } else {
      Get.offNamed(AppRoute.login);
    }
  }

  void login() async {
    User user = User(email: email.value.text, password: password.value.text);
    String requestBody = user.toJson();

    var post = await DioClient().getInstance().post("/login", data: requestBody);

    if (post.statusCode == 200 && post.data['status']) {
      String token = post.data['token'];
      int userId = post.data['user']['id'];

      await prefs.setString('token', token);
      await prefs.setInt('user_id', userId);

      showSuccessDialog(
        Get.context!,
        "Login Success",
        "Welcome Back!",
            () {
          Get.offNamed(AppRoute.home);
        },
      );
    }else {
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
