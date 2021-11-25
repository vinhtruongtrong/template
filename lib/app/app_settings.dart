/*
 * @Author: vinhtruongtrong 
 * @Date: 2021-11-25 13:04:42 
 * @Last Modified by: vinhtruongtrong
 * @Last Modified time: 2021-11-25 13:19:38
 */
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:template/core/core.dart';

final appSettingsProvider = ChangeNotifierProvider<AppSettings>((ref) {
  return AppSettings();
});

class AppSettings extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;
  Locale locale = const Locale('en');

  void changeAppLanguage({required String languageCode}) {
    locale = Locale(languageCode);
    LocalStorageHelper.preferences.then((preferences) {
      preferences.setString('languageCode', languageCode);
    });
    notifyListeners();
  }

  void changeAppThemeMode({required ThemeMode themeMode}) {
    this.themeMode = themeMode;
    LocalStorageHelper.preferences.then((preferences) {
      preferences.setInt('themeMode', themeMode.index);
    });
    notifyListeners();
  }

  Future<void> loadAppSettings() async {
    await LocalStorageHelper.preferences.then(
      (preferences) {
        final appThemeMode = preferences.getInt('themeMode').themeMode;
        final appLanguage = preferences.getString('languageCode');

        themeMode = appThemeMode;
        locale = Locale(appLanguage ?? Intl.systemLocale);
        notifyListeners();
      },
    );
  }
}

extension ThemeModeX on int? {
  ThemeMode get themeMode {
    for (var mode in ThemeMode.values) {
      if (mode.index == this) {
        return mode;
      }
    }
    return ThemeMode.system;
  }
}
