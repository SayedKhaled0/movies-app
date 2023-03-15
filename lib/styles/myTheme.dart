import 'package:flutter/material.dart';

import 'colors.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
      primaryColor: PRIMARY_COLOR,
      scaffoldBackgroundColor: BLACK_BACKGROUND,
      colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: PRIMARY_COLOR,
          onPrimary: Colors.white,
          secondary: COLOR_GOLD,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          background: BLACK_BACKGROUND,
          onBackground: PRIMARY_COLOR,
          surface: Colors.grey,
          onSurface: Colors.black),
      appBarTheme: const AppBarTheme(
          elevation: 0,
          backgroundColor: BLACK_BACKGROUND,
          iconTheme: IconThemeData(color: Colors.white)),
      textTheme: const TextTheme(
        headline1: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: COLOR_GOLD),
        subtitle1: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: PRIMARY_COLOR),
        subtitle2: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: COLOR_GOLD),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: COLOR_GOLD,
        unselectedItemColor: PRIMARY_COLOR,
        selectedIconTheme: IconThemeData(
          color: COLOR_GOLD,
        ),
      ));

  static ThemeData darkTheme = ThemeData(

      primaryColor: PRIMARY_COLOR,
      scaffoldBackgroundColor: BLACK_BACKGROUND,
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: PRIMARY_COLOR,
          onPrimary: Colors.white,
          secondary: PRIMARY_COLOR,
          onSecondary: Colors.white,
          error: Colors.red,
          onError: Colors.white,
          background: PRIMARY_COLOR,
          onBackground: PRIMARY_COLOR,
          surface: Colors.grey,
          onSurface: Colors.black),
      appBarTheme: const AppBarTheme(
          backgroundColor: BLACK_BACKGROUND,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white)),
      textTheme: const TextTheme(
        headline1: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        subtitle1: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: PRIMARY_COLOR),
        subtitle2: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: PRIMARY_COLOR),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: COLOR_GOLD,
          backgroundColor: BLACK_BACKGROUND_nav,
          unselectedItemColor: Colors.grey));
}
