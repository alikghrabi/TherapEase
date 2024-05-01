import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:therapease/Controllers/RegisterController.dart';


class Register extends GetView<RegisterController> {
  const Register({super.key});

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
                        "Registration",
                        style: TextStyle(
                            fontSize: 35,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold
                        ),
                      )
                    ],

                  ),

                  const SizedBox(height: 10),
                  const Text("Name"),
                  const SizedBox(height: 10),
                  TextField(
                    controller: controller.name,
                  ),
                  const SizedBox(height: 10),
                  const Text("Phone Number"),
                  const SizedBox(height: 10),
                  TextField(
                    controller: controller.phone,
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
                            controller.register();
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
