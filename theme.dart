import 'package:flutter/material.dart';

class AppTheme {
  static final Color primary = Color(0xFF0B5A90);
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: primary,
      appBarTheme: AppBarTheme(
        backgroundColor: primary,
        elevation: 0,
      ),
      scaffoldBackgroundColor: Colors.white,
    );
  }
}
