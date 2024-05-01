import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:therapease/Controllers/HomeController.dart';
import '../Routes/AppRoute.dart';


class Home extends GetView<HomeController> {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home"),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [],
      ),
      drawer: Drawer(
        backgroundColor: Colors.purple,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            ElevatedButton(
                onPressed:() {
                  controller.logout();
            },
                child: Text("Logout"))
          ]
        )
      ),
      );
  }
}
