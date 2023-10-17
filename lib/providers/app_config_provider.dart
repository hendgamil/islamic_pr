import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
  //data when change affect in all application
  String AppLang = 'en';
  ThemeMode appMode = ThemeMode.dark;
  void ChangeTheme(ThemeMode newTheme) {
    if (appMode == newTheme) {
      return;
    }
    appMode = newTheme;
    notifyListeners();
  }

  void ChangeLAng(String newLang) {
    if (AppLang == newLang) {
      return;
    }
    AppLang = newLang;
    notifyListeners(); // call to all screen use provider
  }
}
