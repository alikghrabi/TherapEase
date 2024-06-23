import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:therapease/Controllers/TherapistRequestController.dart';
import '../Routes/AppRoute.dart';
import '../Controllers/ProfileController.dart';
import 'package:therapease/Views/widget/profile_card.dart';
import 'package:therapease/Views/widget/base_app_bar.dart';

class TherapistRequest extends GetView<TherapistRequestController> {
  const TherapistRequest({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.redAccent,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            color: Colors.white,
            onPressed: () {
              Get.toNamed(AppRoute.notification);
            },
          ),
        ],
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
                  child: controller.therapist != null
                      ? Text(
                    "Full Name: ${controller.therapist!.name ?? 'N/A'}\nEmail: ${controller.therapist!.email ?? 'N/A'}\nPhone Number: ${controller.therapist!.phone ?? 'N/A'}",
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
                    Get.offNamed(AppRoute.account);
                  },
                ),
                ProfileCard(
                  svgSrc: "lock.svg",
                  title: "Change Password",
                  subTitle: "Change your password",
                  press: () {
                    Get.offNamed(AppRoute.changePassword);
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.redAccent,
              ),
              child: Text(
                "Menu",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Get.toNamed(AppRoute.home);
              },
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text("Search"),
              onTap: () {
                Get.toNamed(AppRoute.search);
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text("Notifications"),
              onTap: () {
                Get.toNamed(AppRoute.notification);
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text("Profile"),
              onTap: () {
                Get.toNamed(AppRoute.profile);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () {
                // controller.logout();
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.redAccent,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        currentIndex: 2,
        onTap: (index) {
          switch (index) {
            case 0:
              Get.toNamed(AppRoute.home);
              break;
            case 1:
              Get.toNamed(AppRoute.search);
              break;
            case 2:
              Get.toNamed(AppRoute.profile);
              break;
            default:
              break;
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
