import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:therapease/Controllers/LoginController.dart';

import '../Routes/AppRoute.dart';


class Login extends GetView<LoginController> {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
        ),
      child: Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "TherapEase",
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],

              ),

              const SizedBox(height: 10),
              const Text("Email"),
              const SizedBox(height: 10),
              TextField(
                controller: controller.email,
              ),
              const SizedBox(height: 10),
              const Text("Password"),
              const SizedBox(height: 10),
              TextField(
                controller: controller.password,
                obscureText: true,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: (){
                        print("clicked");
                        print("email");
                        print(controller.email.text);
                        controller.login();
                      } , child: const Text("Login")
                  ),
                  ElevatedButton(
                      onPressed: (){
                        Get.toNamed(AppRoute.register);
                      } , child: const Text("Register")
                  )
                ],
              ),
            ],
          ),
        ),
      )
      ),
    );
  }
}
