import 'package:flutter/material.dart';

class ThemeApp {
  static Color blackColor = Color(0xff242424);
  static Color primaryLight = Color(0xffB7935F);
  static Color primaryDark = Color(0xff141A2E);
  static Color selectedInDarkMode = Color(0xffffd226);
  static Color whiteColor = Colors.white;
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: primaryLight,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: blackColor),
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 30,
        color: Colors.black,
        fontFamily: "El Messiri",
      ),
      titleMedium: TextStyle(
        fontSize: 25,
        color: Colors.black,
        fontFamily: "El Messiri",
      ),
      titleSmall: TextStyle(
        fontSize: 25,
        color: Colors.black,
        fontFamily: "inter",
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: blackColor,
      unselectedItemColor: whiteColor,
      showUnselectedLabels: true,
    ),
  );
  static ThemeData DarkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    primaryColor: primaryDark,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: whiteColor),
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 30,
        color: Colors.white,
        fontFamily: "El Messiri",
      ),
      titleMedium: TextStyle(
        fontSize: 25,
        color: selectedInDarkMode,
        fontFamily: "El Messiri",
      ),
      titleSmall: TextStyle(
        fontSize: 25,
        color: selectedInDarkMode,
        fontFamily: "inter",
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: selectedInDarkMode,
      unselectedItemColor: whiteColor,
      showUnselectedLabels: true,
    ),
  );
}
