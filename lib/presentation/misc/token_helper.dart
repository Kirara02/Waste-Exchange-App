import 'package:shared_preferences/shared_preferences.dart';

class TokenHelper {
  static const String _isLoggedInKey = 'is_logged_in';

  Future<void> setLoginStatus(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isLoggedInKey, isLoggedIn);
  }

  Future<bool> getLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedInKey) ?? false; // default false jika belum login
  }
}
