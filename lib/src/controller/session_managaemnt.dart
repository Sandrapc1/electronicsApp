
// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../view/dashboard/home_screen.dart';
import '../view/signin/signin_screen.dart';

class SessionManager {
  static const String _loggedInKey = 'is_logged_in';

  static Future<void> setLoggedIn(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_loggedInKey, value);
  }

  static Future<bool> isLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_loggedInKey) ?? false;
  }

  static Future<void> redirectBasedOnLogin(BuildContext context) async {
    final bool loggedIn = await isLoggedIn();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) {
        return loggedIn ? const DashboardScreen() : SignInScreen();
      }),
    );
  }
}