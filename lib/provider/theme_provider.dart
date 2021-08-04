import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeMode themeMode = ThemeMode.dark;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn){
    themeMode = isOn? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class MyTheme{
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xFF212939),
    primaryColor: Color(0xFF323E57),
    //accentColor: ,
    colorScheme: ColorScheme.dark(),
    fontFamily: 'Montserrat',
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Color(0xFFE7EEFB),
    colorScheme: ColorScheme.light(),
    fontFamily: 'Montserrat',
  );
}