import 'package:flutter/material.dart';


class SettingsProvider extends ChangeNotifier{

  ThemeMode currentTheme = ThemeMode.light;

  void changeTheme (ThemeMode newMode){
    currentTheme = newMode;
    notifyListeners();
  }

  String getMainBAckgroundImage(){
    return  currentTheme == ThemeMode.light ?
    'assets/images/main_background.png'
        :
    'assets/images/main_background_dark.png';
  }

  bool isDarkMode (){
    return currentTheme== ThemeMode.dark;
  }

  String selectedTheme (){
    if (isDarkMode()) {
      return 'Dark';
  }
    else {
      return 'Light';
    }
  }
}