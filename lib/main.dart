import 'package:flutter/material.dart';
import 'package:makhanerush/pages/home.dart';
import 'package:makhanerush/provider/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:stacked_themes/stacked_themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          title: 'MakhaneRush',
          debugShowCheckedModeBanner: false,
          themeMode: themeProvider.themeMode,
          theme: MyTheme.lightTheme,
          darkTheme: MyTheme.darkTheme,
          home: Home(),
        );
      }
    );
  }
}
