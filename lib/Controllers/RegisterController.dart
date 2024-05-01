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
  void onInit() async{
    // TODO: implement onInit
    super.onInit();

    prefs = await SharedPreferences.getInstance();
  }

    void register() async {
      User user = User(name: name.value.text, email: email.value.text, phone: phone.value.text, password: password.value.text);
      String request_body = user.toJson();
      var post = await DioClient().getInstance().post('/register', data: request_body);
      if(post.statusCode==200) {
        showSuccessDialog(Get.context!, "Success", "User Registered Successfully", (){
          print(post.data);
          prefs.setString('token', post.data['token']);
          Get.offNamed(AppRoute.home);
        });
      }
    }
}