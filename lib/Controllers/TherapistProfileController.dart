import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:therapease/Models/Therapist.dart';
import 'package:http/http.dart' as http;

import '../Routes/AppRoute.dart';

class TherapistProfileController extends GetxController {
  late SharedPreferences prefs;
  Therapist? therapist; // Declare as nullable

  @override
  void onInit() {
    super.onInit();
    initializePreferences();
  }

  Future<void> initializePreferences() async {
    prefs = await SharedPreferences.getInstance();

    // Check if token and therapist_id are available in SharedPreferences
    if (prefs.getString('token') != null && prefs.getInt('therapist_id') != null) {
      await fetchTherapistInfo(prefs.getInt('therapist_id'));
    } else {
      // Redirect to login if the user is not authenticated
      Get.offNamed(AppRoute.therapistLogin);
    }
  }

  void logout() {
    prefs.remove("token");
    prefs.remove("therapist_id");
    Get.offAllNamed(AppRoute.therapistLogin); // Use Get.offAllNamed to clear navigation stack
  }

  Future<void> fetchTherapistInfo(int? id) async {
    try {
      var url = Uri.parse("http://127.0.0.1:8000/api/therapistInfoById/$id"); // Adjust IP address as needed
      var response = await http.get(url);

      if (response.statusCode == 200) {
        // Decode the response body to JSON
        var jsonResponse = jsonDecode(response.body);
        // Parse JSON to Therapist object using fromJson factory method
        therapist = Therapist.fromJson(jsonResponse);
        update(); // Notify listeners that therapist data has been updated
      } else {
        throw Exception('Failed to fetch therapist info: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching therapist info: $e');
      logout(); // Example: Log out user on error
    }
  }
}
