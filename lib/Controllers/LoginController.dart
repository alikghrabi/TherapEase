import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:therapease/Models/User.dart';


class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void login() {
    User user = User(email:email.value.text, password:password.value.text);
    String request_body = user.toJson();
  }
}