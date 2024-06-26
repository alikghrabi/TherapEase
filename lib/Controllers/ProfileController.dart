import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:therapease/Models/User.dart';
import '../Core/Network/DioClient.dart';
import '../Routes/AppRoute.dart';
import 'package:http/http.dart' as http;

class ProfileController extends GetxController {
  late SharedPreferences prefs;
  User? user; // Declare as nullable

  @override
  void onInit() async {
    super.onInit();
    prefs = await SharedPreferences.getInstance();

    if (prefs.getString('token') != null && prefs.getInt('user_id') != null) {
      await fetchUserInfo(prefs.getInt('user_id'));
    } else {
      // Redirect to login only if the user is not authenticated
      Get.offNamed(AppRoute.login);
    }
  }

  void logout() {
    prefs.remove("token");
    prefs.remove("user_id");
    Get.offAllNamed(AppRoute.login); // Use Get.offAllNamed to clear navigation stack
  }

  Future<void> fetchUserInfo(int? id) async {
    try {
      var url = Uri.parse("http://127.0.0.1:8000/api/user/$id");
      var response = await http.get(url);

      if (response.statusCode == 200) {
        // Decode the response body to JSON
        var jsonResponse = jsonDecode(response.body);
        // Parse JSON to User object using fromJson factory method
        user = User.fromJson(jsonResponse);
        update();
      } else {
        throw Exception('Failed to fetch user info: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching user info: $e');
      logout(); // Example: Log out user on error
    }
  }
}
