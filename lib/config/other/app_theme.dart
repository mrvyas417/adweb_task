import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData appLightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.red,
    primaryColorLight: Colors.red,
    fontFamily: 'Neue Plak',
    scaffoldBackgroundColor: AppColors.scaffoldColor,
    //primarySwatch: Colors.grey,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      splashColor: Colors.green.withOpacity(0.25),
      backgroundColor: Colors.green,
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.green,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
    ),
    textTheme: const TextTheme(
      headline6: TextStyle(
        color: Colors.black,
        fontStyle: FontStyle.normal,
      ),
      headline5: TextStyle(
        fontStyle: FontStyle.normal,
        color: Colors.black,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(horizontal: 20),
        ),
      ),
    ),
  );

  static ThemeData appDarkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.green,
    primaryColorDark: Colors.green,
    //scaffoldBackgroundColor: Colors.black,
    //primarySwatch: Colors.purple,
    fontFamily: 'Neue Plak',
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.white,
      splashColor: Colors.red.withOpacity(0.25),
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.purpleAccent,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(horizontal: 40),
        ),
      ),
    ),
    textTheme: const TextTheme(
      headline6: TextStyle(
        color: Colors.white,
      ),
      headline5: TextStyle(
        color: Colors.white,
      ),
    ),
  );
}
