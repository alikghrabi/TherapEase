import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:therapease/Controllers/SearchingController.dart';
import '../Routes/AppRoute.dart';





class Search extends GetView<SearchingController> {
  const Search({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search",
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Add your content here
                ],
              ),
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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.redAccent,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white54,
        currentIndex: 1, // Change this according to the selected tab
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
