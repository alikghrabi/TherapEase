// search.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:therapease/Controllers/TherapistRequestController.dart';
import '../Controllers/SearchingController.dart';
import '../Models/Therapist.dart';
import '../Routes/AppRoute.dart';

class TherapistRequest extends GetView<TherapistRequestController> {
  const TherapistRequest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Requests",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.redAccent,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            color: Colors.white,
            onPressed: () {
              Get.toNamed(AppRoute.therapistNotification);
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Expanded(
           // child: Obx(() {

           // }),
          //),
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
                // Navigate to the Notifications screen
                Get.toNamed(AppRoute.therapistNotification);
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text("Profile"),
              onTap: () {
                Get.toNamed(AppRoute.therapistProfile);
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
        currentIndex: 1, // Change this according to the selected tab
        onTap: (index) {
          switch (index) {
            case 0:
              Get.toNamed(AppRoute.therapistHome);
              break;
            case 1:
              Get.toNamed(AppRoute.therapistRequest);
              break;
            case 2:
              Get.toNamed(AppRoute.therapistProfile);
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
