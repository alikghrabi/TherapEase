import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:therapease/Controllers/RegisterController.dart';

import '../Routes/AppRoute.dart';


class Register extends GetView<RegisterController> {
  const Register({super.key});

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
              Text(
                  "User Registration",
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
              ),
              const SizedBox(height: 20),
              Card(
                margin: const EdgeInsets.all(20),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      TextFormField(
                        controller: controller.name,
                        decoration: InputDecoration(
                          labelText: "Full Name",
                          hintText: "Enter your full name",
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: Icon(Icons.person, color: Colors.redAccent),
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

                      TextFormField(
                        controller: controller.phone,
                        decoration: InputDecoration(
                          labelText: "Phone Number",
                          hintText: "Enter your phone number",
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon: Icon(Icons.phone, color: Colors.redAccent),
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
                            controller.register();
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }}
