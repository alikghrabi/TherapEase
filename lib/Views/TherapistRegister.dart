import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:therapease/Controllers/RegisterController.dart';

import '../Controllers/TherapistRegisterController.dart';
import '../Routes/AppRoute.dart';


class TherapistRegister extends GetView<TherapistRegisterController> {
  const TherapistRegister({super.key});

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
                "Therapist Registration",
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

                      TextFormField(
                        controller: controller.experience,
                        decoration: InputDecoration(
                          labelText: "Experience",
                          hintText: "How many number of experience do you have?",
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
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: controller.description,
                        decoration: InputDecoration(
                          labelText: "Description ",
                          hintText: "Provide a brief description (if needed)",
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
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 20),

                      Obx(() => Column(
                        children: [
                          TextButton.icon(
                            icon: const Icon(Icons.upload_file, color: Colors.redAccent),
                            label: const Text("Upload your CV (PDF)", style: TextStyle(color: Colors.redAccent)),
                            onPressed: () {
                              controller.pickCvFile();
                            },
                          ),
                          if (controller.cvFile.value != null)
                            Text("File: ${controller.cvFile.value!.path.split('/').last}", style: const TextStyle(color: Colors.green)),
                          const SizedBox(height: 20),
                          TextButton.icon(
                            icon: const Icon(Icons.image, color: Colors.redAccent),
                            label: const Text("Upload National ID Front Image", style: TextStyle(color: Colors.redAccent)),
                            onPressed: () {
                              controller.pickImage1();
                            },
                          ),
                          if (controller.image1.value != null)
                            Text("Image: ${controller.image1.value!.path.split('/').last}", style: const TextStyle(color: Colors.green)),
                          const SizedBox(height: 20),
                          TextButton.icon(
                            icon: const Icon(Icons.image, color: Colors.redAccent),
                            label: const Text("Upload National ID Back Image", style: TextStyle(color: Colors.redAccent)),
                            onPressed: () {
                              controller.pickImage2();
                            },
                          ),
                          if (controller.image2.value != null)
                            Text("Image: ${controller.image2.value!.path.split('/').last}", style: const TextStyle(color: Colors.green)),
                        ],
                      )),
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
