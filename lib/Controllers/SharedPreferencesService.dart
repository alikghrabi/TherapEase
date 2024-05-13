import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  SharedPreferences get prefs => _prefs;
}
