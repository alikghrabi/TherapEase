import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:therapease/Routes/AppPage.dart';
import 'package:therapease/Routes/AppRoute.dart';
import 'package:therapease/Views/Login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "TherapEase",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: AppRoute.login,
      getPages: AppPage.pages,
      home: Login(),
    );
  }
}

