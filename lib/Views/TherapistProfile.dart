import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import '../Controllers/TherapistProfileController.dart';
import '../Routes/AppRoute.dart';
import '../Controllers/ProfileController.dart';
import 'package:therapease/Views/widget/profile_card.dart';
import 'package:therapease/Views/widget/base_app_bar.dart';

class TherapistProfile extends GetView<TherapistProfileController> {
  const TherapistProfile({Key? key});

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
                  svgSrc: "settings.svg",
                  title: "Settings",
                  subTitle: "Change profile information",
                  press: () {
                    Get.offNamed(AppRoute.therapistSettings);
                  },
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
              leading: Icon(Icons.book_sharp),
              title: Text("Bookings"),
              onTap: () {
                // Navigate to the Home screen
                Get.toNamed(AppRoute.therapistHome);
              },
            ),
            ListTile(
              leading: Icon(Icons.assignment),
              title: Text("Requests"),
              onTap: () {
                // Navigate to the Search screen
                Get.toNamed(AppRoute.therapistRequest);
              },
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text("Notifications"),
              onTap: () {
                // Navigate to the Search screen
                Get.toNamed(AppRoute.therapistNotification);
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text("Profile"),
              onTap: () {
                // Navigate to the Profile screen
                Get.toNamed(AppRoute.profile);
              },
            ),
            Divider(), // Add a divider
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () {
                controller.logout();
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.redAccent,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        currentIndex: 2, // Change this according to the selected tab
        onTap: (index) {
          switch (index) {
            case 0:
              Get.toNamed(AppRoute.therapistHome);
              break;
            case 1:
              Get.toNamed(AppRoute.therapistRequest);
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
            icon: Icon(Icons.book_sharp),
            label: "Bookings",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: "Requests",
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
