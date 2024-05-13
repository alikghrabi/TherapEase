import 'package:therapease/Controllers/AccountController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import '../Routes/AppRoute.dart';
import '../Views/widget/base_button.dart';
import '../Views/widget/base_input.dart';
import '../Views/widget/base_label.dart';
import '../Views/widget/base_app_bar.dart';
import 'dart:io';

class AccountInfo extends GetView<AccountController> {
  const AccountInfo({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Change Account Info",
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
                BaseLabel(text: 'Full Name'),
                const SizedBox(height: 5),
                BaseInput(
                  labelText: '',
                  maxLength: 30,
                  iconAtStart: true,
                  prefixIcon: Icon(LineIcons.user),
                  controller: controller.name,
                ),
                const SizedBox(height: 20),
                BaseLabel(text: 'Phone Number'),
                const SizedBox(height: 5),
                BaseInput(
                  labelText: '',
                  iconAtStart: true,
                  prefixIcon: Icon(LineIcons.lock),
                  controller: controller.phoneNumber,
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: BaseButton(
                    onPressed: () => {
                      controller.changeCredentials()
                    },
                    text: 'Save changes',
                    borderRadius: 2,
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
