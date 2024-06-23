import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../Controllers/TherapistNotificationController.dart';
import '../Routes/AppRoute.dart';





class TherapistNotification extends GetView<TherapistNotificationController> {
  const TherapistNotification({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notifications",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.redAccent,
        iconTheme: IconThemeData(color: Colors.white),
        leading: GestureDetector(
          onTap: () {
            Get.toNamed(AppRoute.therapistHome);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

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
                Get.toNamed(AppRoute.search);
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
                Get.toNamed(AppRoute.profile);
              },
            ),
            Divider(), // Add a divider
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

    );
  }
}
