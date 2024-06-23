  import 'package:flutter/cupertino.dart';
  import 'package:get/get.dart';
  import 'package:get/get_state_manager/src/simple/get_controllers.dart';
  import 'package:shared_preferences/shared_preferences.dart';
  import 'package:therapease/Core/showSuccessDialog.dart';

  import '../Core/Network/DioClient.dart';
  import '../Models/User.dart';
  import '../Routes/AppRoute.dart';


  class AccountController extends GetxController {
    TextEditingController name = TextEditingController();
    TextEditingController phoneNumber = TextEditingController();

    late SharedPreferences prefs;


    @override
    void onInit() async {
      super.onInit();

      prefs = await SharedPreferences.getInstance();

      if(prefs.getString('token') != null) {
        Get.offNamed(AppRoute.account);
      } else {
        Get.offNamed(AppRoute.login);
      }
    }

    void logout() {
      prefs.remove("token");
      Get.offNamed(AppRoute.login);
    }

    bool checkFields() {
      if (name.text.isEmpty && phoneNumber.text.isEmpty) {
        showSuccessDialog(
            Get.context!, "Error", "Full Name or Phone number is required!", () {
        });
        return false;
      }
      return true;
    }

    void changeCredentials() async {
      if (checkFields()) {
        int? userId = prefs.getInt('user_id');
        if (userId != null) {
          User user = User(name: name.value.text, phone: phoneNumber.value.text);
          String requestBody = user.toJson();

          try {
            var response = await DioClient().getInstance().put(
              "/changeAccountInfo/$userId",
              data: requestBody,
            );

            if (response.statusCode == 200) {
              showSuccessDialog(
                Get.context!,
                "Success",
                "Account Information updated successfully",
                    () {},
              );
            } else {
              // Handle response errors here
              print('Failed to update account information: ${response.statusCode}');
            }
          } catch (e) {
            // Handle network or other errors here
            print('Error updating account information: $e');
          }
        } else {
          // Handle case where userId is null
          print('User ID is null');
        }
      } else {
        // Handle case where fields validation fails
        print('Fields validation failed');
      }
    }

    }
