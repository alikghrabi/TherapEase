import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:therapease/Controllers/LoginController.dart';


class Login extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
        ),
      child: Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
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

              SizedBox(height: 10),
              Text("Email"),
              SizedBox(height: 10),
              TextField(
                controller: controller.email,
              ),
              SizedBox(height: 10),
              Text("Password"),
              SizedBox(height: 10),
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
                      } , child: Text("Login")
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
