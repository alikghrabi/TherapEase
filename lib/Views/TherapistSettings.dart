import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import '../Routes/AppRoute.dart';
import '../Controllers/ProfileController.dart';
import 'package:therapease/Views/widget/profile_card.dart';
import 'package:therapease/Views/widget/base_app_bar.dart';

class TherapistSettings extends GetView<ProfileController> {
  const TherapistSettings({Key? key});

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
                SizedBox(height: 40),
                Center(
                  child: Text(
                    "Your Account Info",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: controller.user != null
                      ? Text(
                    "Full Name: ${controller.user!.name ?? 'N/A'}\nEmail: ${controller.user!.email ?? 'N/A'}\nPhone Number: ${controller.user!.phone ?? 'N/A'}",
                    style: TextStyle(fontSize: 16),
                  )
                      : CircularProgressIndicator(), // Example of showing loading indicator
                ),


                SizedBox(height: 80),
                ProfileCard(
                  svgSrc: "profile.svg",
                  title: "Profile Information",
                  subTitle: "Change your account information",
                  press: () {
                   // Get.offNamed(AppRoute.account);
                  },
                ),
                ProfileCard(
                  svgSrc: "lock.svg",
                  title: "Change Password",
                  subTitle: "Change your password",
                  press: () {
                    // Get.offNamed(AppRoute.changePassword);
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
