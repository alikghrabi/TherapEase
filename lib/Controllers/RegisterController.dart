import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:therapease/Core/showSuccessDialog.dart';
import 'package:therapease/Models/User.dart';
import '../Core/Network/DioClient.dart';
import '../Routes/AppRoute.dart';
import 'package:shared_preferences/shared_preferences.dart';


  class RegisterController extends GetxController {
    TextEditingController name = TextEditingController();
    TextEditingController phone = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();

    late SharedPreferences prefs;

    @override
    void onInit() async {
      // TODO: implement onInit
      super.onInit();

      prefs = await SharedPreferences.getInstance();
    }

    bool checkFields() {
      if (name.text.isEmpty) {
        showSuccessDialog(
            Get.context!, "Error", "Full Name is required", () {
        });
        return false;
      } else if (phone.text.isEmpty) {
        showSuccessDialog(
            Get.context!, "Error", "Phone Number is required", () {
        });
        return false;
      } else if (email.text.isEmpty) {
        showSuccessDialog(
            Get.context!, "Error", "Email is required", () {
        });
        return false;        
      } else if (password.text.isEmpty) {
        showSuccessDialog(
            Get.context!, "Error", "Password is required", () {
        });
        return false;
      }
      return true;
    }

    void register() async {
      if (checkFields()) {
        User user = User(name: name.value.text,
            email: email.value.text,
            phone: phone.value.text,
            password: password.value.text);
        String request_body = user.toJson();
        var post = await DioClient().getInstance().post(
            '/register', data: request_body);
        if (post.statusCode == 200) {
          showSuccessDialog(
              Get.context!, "Success", "User Registered Successfully", () {
            prefs.setString('token', post.data['token']);
            Get.offNamed(AppRoute.home);
          });
        }
      }
    }
  }