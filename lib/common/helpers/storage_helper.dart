import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageHelper {
  static late SharedPreferences prefs;
  static const String isDarkModeKey = 'isDarkMode';

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setDarkMode(bool isDarkMode) async {
    await prefs.setBool(isDarkModeKey, isDarkMode);

    Get.changeThemeMode(isDarkMode ? ThemeMode.dark : ThemeMode.light);
  }

  static bool get isDarkMode {
    bool? isDarkMode = prefs.getBool(isDarkModeKey);
    isDarkMode ??= (ThemeMode.system == ThemeMode.dark);
    return isDarkMode;
  }

  static final ThemeMode themMode = isDarkMode //
      ? ThemeMode.dark
      : ThemeMode.light;
}
