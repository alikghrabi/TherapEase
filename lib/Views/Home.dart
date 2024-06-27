import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:therapease/Controllers/HomeController.dart';
import '../Routes/AppRoute.dart';

class Home extends GetView<HomeController> {
  const Home({Key? key});

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
              Get.toNamed(AppRoute.notification);
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
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                // Navigate to the Home screen
                Get.toNamed('/home');
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
        currentIndex: 0, // Change this according to the selected tab
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
