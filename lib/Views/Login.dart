import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Ensure you have flutter_svg package in your pubspec.yaml
import 'package:get/get.dart';
import 'package:therapease/Controllers/LoginController.dart';
import '../Routes/AppRoute.dart';

class Login extends GetView<LoginController> {
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
              SvgPicture.asset(
                'lib/asset/images/Psychologist-pana.svg', // Ensure the path is correct
                height: 300, // Set an appropriate size for the image
              ),
              const SizedBox(height: 20),
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
                      TextFormField(
                        controller: controller.password,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Password",
                          hintText: "Enter your password",
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: Icon(Icons.lock, color: Colors.redAccent),
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
                      ),
                      const SizedBox(height: 20),
                      // Login Button
                      ElevatedButton(
                          onPressed: () {
                            print("Login clicked");
                            print("email: ${controller.email.text}");
                            controller.login();
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.redAccent,
                          ),
                          child: const Text("Login")
                      ),
                      const SizedBox(height: 20),
                      // Sign up Link
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
