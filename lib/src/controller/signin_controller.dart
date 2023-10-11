import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesController extends GetxController {
  Future<void> saveUserData(String email, String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getString('email');
    prefs.getString('password');
  }

  Future<String?> getEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('email');
  }

  Future<String?> getPassword() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('password');
  }
}
