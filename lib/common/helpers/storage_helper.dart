import 'package:daelim_univ/common/helpers/locale_helper.dart';
import 'package:easy_extension/easy_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageHelper {
  static late SharedPreferences prefs;
  static const String isDarkModeKey = 'isDarkMode';
  static const String localeKey = 'locale';

  /// SharedPreferences 초기화
  /// - 반드시 [runApp] 하기 전에 `await StorageHelper.init()` 을 해야함
  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  /// 다크 테마 설정
  /// - [isDarkMode]
  ///   - true: 다크 테마
  ///   - false: 라이트 테마
  static Future<void> setDarkMode(bool isDarkMode) async {
    await prefs.setBool(isDarkModeKey, isDarkMode);
    Get.changeThemeMode(isDarkMode ? ThemeMode.dark : ThemeMode.light);
  }

  /// 다크 테마인지 확인하는 getter
  /// - [return]
  ///   - true: 다크 테마
  ///   - false: 라이트 테마
  static bool get isDarkMode {
    bool? isDarkMode = prefs.getBool(isDarkModeKey);
    isDarkMode ??= (ThemeMode.system == ThemeMode.dark);
    return isDarkMode;
  }

  /// 현재 테마 상태 가져오기
  static ThemeMode get themeMode => isDarkMode //
      ? ThemeMode.dark
      : ThemeMode.light;

  /// 국제화 언어코드 저장
  static Future<void> setLocale(Locale locale) async {
    await prefs.setString(localeKey, locale.languageCode);
    Get.updateLocale(locale);
  }

  /// 국제화 언어코드 삭제
  static Future<bool> removeLocale() {
    return prefs.remove(localeKey);
  }

  static Locale get locale {
    final languageCode = prefs.getString(localeKey);

    Log.green('저장된 언어코드: $languageCode');

    if (languageCode == null) {
      return Get.deviceLocale ?? LocaleHelper.english;
    }

    // 2-1. Switch Reject
    // return switch (languageCode) {
    //   'ko' => LocaleHelper.korean,
    //   _ => LocaleHelper.english,
    // };

    // 1. IF문
    if (languageCode == LocaleHelper.korean.languageCode) {
      return LocaleHelper.korean;
    } else {
      return LocaleHelper.english;
    }

    // 1-2. IF문 Lamda
    // return languageTag == LocaleHelper.korean.languageCode //
    //     ? LocaleHelper.korean
    //     : LocaleHelper.english;

    // 2. Switch
    // switch (languageCode) {
    //   case 'ko':
    //     return LocaleHelper.korean;
    //   default:
    //     return LocaleHelper.english;
    // }
  }
}
