import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeMode themeMode = ThemeMode.system;

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
    colorScheme: ColorScheme.dark(),
    fontFamily: 'Montserrat',
    iconTheme: IconThemeData(color: Color(0xFFE7EEFB)),
    buttonColor: Color(0xFF5D6884),
    accentColor: Colors.teal
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Color(0xFFE7EEFB),
    colorScheme: ColorScheme.light(),
    fontFamily: 'Montserrat',
    iconTheme: IconThemeData(color: Color(0xFF323E57)),
    buttonColor: Color(0xFFB4BBC6),
    accentColor: Colors.lightBlue
  );
}