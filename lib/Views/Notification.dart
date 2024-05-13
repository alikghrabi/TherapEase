import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:therapease/Controllers/NotificationController.dart';
import 'package:therapease/Controllers/SearchingController.dart';
import '../Routes/AppRoute.dart';





class Notification extends GetView<NotificationController> {
  const Notification({Key? key});

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
            Get.toNamed(AppRoute.home);
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
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                // Navigate to the Home screen
                Get.toNamed(AppRoute.home);
              },
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text("Search"),
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
