import 'package:shared_preferences/shared_preferences.dart';

class ThemePreferences {
  void setTheme(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('theme', value);
  }

  Future<bool> getTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool('theme') ?? false;
  }
}
