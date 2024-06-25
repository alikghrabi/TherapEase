import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import '../Controllers/TherapistChangePasswordController.dart';
import '../Routes/AppRoute.dart';
import '../Controllers/ChangePasswordController.dart';
import '../Views/widget/base_button.dart';
import '../Views/widget/base_input.dart';
import '../Views/widget/base_label.dart';
import '../Views/widget/base_app_bar.dart';

class TherapistChangePassword extends GetView<TherapistChangePasswordController> {
  const TherapistChangePassword({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Change your password",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.redAccent,
        iconTheme: IconThemeData(color: Colors.white),
        leading: GestureDetector(
          onTap: () {
            Get.toNamed(AppRoute.therapistSettings);
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
                BaseLabel(text: 'Current password'),
                const SizedBox(height: 5),
                BaseInput(
                  labelText: '',
                  maxLength: 30,
                  iconAtStart: true,
                  prefixIcon: Icon(LineIcons.eye),
                  controller: controller.currentPassword,
                ),
                const SizedBox(height: 20),
                BaseLabel(text: 'New password'),
                const SizedBox(height: 5),
                BaseInput(
                  labelText: '',
                  maxLength: 30,
                  iconAtStart: true,
                  prefixIcon: Icon(LineIcons.lock),
                  controller: controller.newPassword,

                ),
                const SizedBox(height: 20),
                BaseLabel(text: 'Confirm new password'),
                const SizedBox(height: 5),
                BaseInput(
                  labelText: '',
                  iconAtStart: true,
                  prefixIcon: Icon(LineIcons.lock),
                  controller: controller.retypePassword,

                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: BaseButton(
                    onPressed: () => {
                      controller.changePassword()
                    },
                    text: 'Change Password',
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
