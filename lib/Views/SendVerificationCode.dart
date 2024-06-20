import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Ensure you have flutter_svg package in your pubspec.yaml
import 'package:get/get.dart';
import 'package:therapease/Controllers/LoginController.dart';
import 'package:therapease/Controllers/SendVerificationCodeController.dart';
import '../Routes/AppRoute.dart';

class Login extends GetView<SendVerificationCodeController> {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background to white
      appBar: AppBar(
        backgroundColor: Color(0xFFFF725E), // AppBar color using a hexadecimal code
        title: Text(
          "TherapEase",
          style: TextStyle(color: Colors.white), // Setting the text color to white
        ), // AppBar title
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                margin: const EdgeInsets.all(20),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Email TextFormField
                      TextFormField(
                        controller: controller.email,
                        decoration: InputDecoration(
                          labelText: "Email",
                          hintText: "Enter your email",
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: Icon(Icons.email, color: Colors.redAccent),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.redAccent.shade200, width: 2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.redAccent, width: 2),
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 20),
                      // Password TextFormField
                      // Login Button
                      ElevatedButton(
                          onPressed: () {
                            controller.sendVerificationCode();
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.redAccent,
                          ),
                          child: const Text("Send Verification Code")
                      ),
                      const SizedBox(height: 20),
                      // Sign up Link

                      InkWell(
                        onTap: () {
                          Get.toNamed(AppRoute.login);
                        },
                        child: Text(
                          "Already have an account? Log in",
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),

                      InkWell(
                        onTap: () {
                          Get.toNamed(AppRoute.register);
                        },
                        child: Text(
                          "New here? Sign up",
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
