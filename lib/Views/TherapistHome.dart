import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:therapease/Controllers/TherapistHomeController.dart';
import '../Routes/AppRoute.dart';

class TherapistHome extends GetView<TherapistHomeController> {
  const TherapistHome({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Therapease",
          style: TextStyle(color: Colors.white), // Set title color to white
        ),
        backgroundColor: Colors.redAccent,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            color: Colors.white, // Set icon color to white
            onPressed: () {
              Get.toNamed(AppRoute.therapistNotification);
            },
          ),
        ],
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome to Therapease",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add functionality here
              },
              child: Text("Button"),
            ),
            // Add more fields or widgets as needed
          ],
        ),
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
                // Navigate to the Profile screen
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
        currentIndex: 0, // Change this according to the selected tab
        onTap: (index) {
          switch (index) {
            case 0:
              Get.toNamed(AppRoute.therapistHome);
              break;
            case 1:
              // Get.toNamed(AppRoute.search);
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
