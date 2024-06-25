import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import '../Controllers/TherapistSettingsController.dart';
import '../Routes/AppRoute.dart';
import '../Controllers/ProfileController.dart';
import 'package:therapease/Views/widget/profile_card.dart';
import 'package:therapease/Views/widget/base_app_bar.dart';

class TherapistSettings extends GetView<TherapistSettingsController> {
  const TherapistSettings({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Settings",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.redAccent,
        iconTheme: IconThemeData(color: Colors.white),
        leading: GestureDetector(
          onTap: () {
            Get.toNamed(AppRoute.therapistProfile);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: 80),
                ProfileCard(
                  svgSrc: "profile.svg",
                  title: "Profile Information",
                  subTitle: "Change your account information",
                  press: () {
                   Get.offNamed(AppRoute.therapistAccount);
                  },
                ),
                ProfileCard(
                  svgSrc: "lock.svg",
                  title: "Change Password",
                  subTitle: "Change your password",
                  press: () {
                    Get.offNamed(AppRoute.therapistChangePassword);
                  },
                ),
                ProfileCard(
                  svgSrc: "card.svg",
                  title: "Payment Methods",
                  subTitle: "Add your credit & debit cards",
                  press: () {},
                ),
                ProfileCard(
                  svgSrc: "afb.svg",
                  title: "Add Social Account",
                  subTitle: "Add Facebook, Twitter etc ",
                  press: () {},
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
