import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:therapease/Controllers/AddSocialAccountController.dart';
import '../Controllers/PaymentMethodsController.dart';
import '../Routes/AppRoute.dart';
import '../Controllers/ChangePasswordController.dart';
import '../Views/widget/base_button.dart';
import '../Views/widget/base_input.dart';
import '../Views/widget/base_label.dart';
import '../Views/widget/base_app_bar.dart';

class SocialAccounts extends GetView<AddSocialAccountController> {
  const SocialAccounts({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Add Payment Methods",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.redAccent,
        iconTheme: IconThemeData(color: Colors.white),
        leading: GestureDetector(
          onTap: () {
            Get.toNamed(AppRoute.profile);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Coming soon",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
