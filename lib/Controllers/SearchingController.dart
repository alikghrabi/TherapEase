import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Models/Therapist.dart';
import '../Routes/AppRoute.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SearchingController extends GetxController {
  late SharedPreferences prefs;
  var therapists = <Therapist>[].obs;
  var filteredTherapists = <Therapist>[].obs;
  var searchQuery = ''.obs; // Observable string for search query

  @override
  void onInit() async {
    super.onInit();
    prefs = await SharedPreferences.getInstance();

    if (prefs.getString('token') != null) {
      fetchTherapists(); // Fetch therapists on initialization
      Get.offNamed(AppRoute.search);
    } else {
      Get.offNamed(AppRoute.login);
    }

    // Observe changes to searchQuery and update filteredTherapists accordingly
    ever(searchQuery, (_) {
      filterTherapists();
    });
  }

  void fetchTherapists() async {
    try {
      final url = Uri.parse('http://127.0.0.1:8000/api/therapists'); // Replace with your API endpoint
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> therapistsJson = jsonDecode(response.body)['therapists'];
        therapists.assignAll(therapistsJson.map((json) => Therapist.fromJson(json)).toList());
        filteredTherapists.assignAll(therapists); // Initialize filteredTherapists with all therapists
      } else {
        throw Exception('Failed to load therapists');
      }
    } catch (e) {
      print('Error fetching therapists: $e');
      // Handle error or show error message to the user
    }
  }

  void filterTherapists() {
    // Clear existing filtered list
    filteredTherapists.clear();

    // If search query is empty, show all therapists
    if (searchQuery.isEmpty) {
      filteredTherapists.assignAll(therapists);
    } else {
      // Filter therapists based on searchQuery
      var query = searchQuery.toLowerCase();
      var filteredList = therapists.where((therapist) =>
      therapist.name!.toLowerCase().contains(query) ||
          therapist.email!.toLowerCase().contains(query) ||
          therapist.phone!.toLowerCase().contains(query)).toList();
      filteredTherapists.assignAll(filteredList);
    }
  }

  void logout() {
    prefs.remove("token");
    prefs.remove("user_id");
    Get.offAllNamed(AppRoute.login);
  }
}
