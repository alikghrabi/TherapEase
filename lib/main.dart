import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:therapease/Routes/AppPage.dart';
import 'package:therapease/Routes/AppRoute.dart';
import 'package:therapease/Views/Login.dart';
import 'package:therapease/Controllers/LoginController.dart';
import 'package:therapease/Bindings/LoginBinding.dart'; // Import LoginBinding

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "TherapEase",
      debugShowCheckedModeBanner: false, // Set debugShowCheckedModeBanner to false
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.redAccent),
      ),
      initialRoute: AppRoute.login,
      getPages: AppPage.pages,
    );
  }
}
