import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _sharedPreferences;

  static SharedPreferences get sharedPreferences => _sharedPreferences;

  static Future initialize() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }
}
