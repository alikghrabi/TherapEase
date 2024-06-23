import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:therapease/Models/User.dart';
import '../Core/Network/DioClient.dart';
import '../Routes/AppRoute.dart';

class ProfileController extends GetxController {
  late SharedPreferences prefs;
  User? user; // Declare as nullable

  @override
  void onInit() async {
    super.onInit();
    prefs = await SharedPreferences.getInstance();

    if (prefs.getString('token') != null && prefs.getString('user_id') != null) {
      await fetchUserInfo(prefs.getString('user_id'));
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

  Future<void> fetchUserInfo(String? id) async {
    try {
      var response = await DioClient().getInstance().get("/user/$id");

      if (response.statusCode == 200) {
        user = User.fromJson(response.data);
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
