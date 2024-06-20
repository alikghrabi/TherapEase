import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Ensure you have flutter_svg package in your pubspec.yaml
import 'package:get/get.dart';
import 'package:therapease/Controllers/LoginController.dart';
import 'package:therapease/Controllers/SendVerificationCodeController.dart';
import '../Controllers/EnterVerificationCodeController.dart';
import '../Routes/AppRoute.dart';

class Login extends GetView<EnterVerificationCodeController> {
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
                        controller: controller.verification_code,
                        decoration: InputDecoration(
                          labelText: "Verification Code",
                          hintText: "Enter verification code",
                          fillColor: Colors.white,
                          filled: true,
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
                            controller.checkVerificationCode();
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.redAccent,
                          ),
                          child: const Text("Submit")
                      ),
                      const SizedBox(height: 20),
                      // Sign up Link


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
