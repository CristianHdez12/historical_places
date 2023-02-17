
import 'package:flutter/material.dart';

class Styles{

  static ThemeData themeData(bool isDarkTheme, BuildContext context){
    return ThemeData(
      primarySwatch: Colors.deepPurple,
      primaryColor: isDarkTheme ? const Color(0xFF1f1f1f) : const Color(0xFF4b1c71),
      backgroundColor: isDarkTheme ? const Color(0xFF121212) : const Color(0xffF1F5FB),
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      cardColor: isDarkTheme ? const Color(0xFF1f1f1f) : const Color(0xffF1F5FB),
    );
  }
}