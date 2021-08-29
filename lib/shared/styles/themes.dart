import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

ThemeData lightMode() => ThemeData(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: MAIN_COLOR,
        size: 25.0,
      ),
      appBarTheme: AppBarTheme(
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        color: MAIN_COLOR,
        elevation: 5.0,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: MAIN_COLOR,
        selectedIconTheme: IconThemeData(
          size: 30.0,
        ),
        unselectedIconTheme: IconThemeData(
          color: Colors.grey,
          size: 23.0,
        ),
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        elevation: 0.0,
      ),
    );

ThemeData darkMode() => ThemeData(
  textTheme: TextTheme(
    headline6: TextStyle(
      color: Colors.white
    )
  ),
      scaffoldBackgroundColor: Colors.grey[850],
      iconTheme: IconThemeData(
        color: MAIN_COLOR,
        size: 25.0,
      ),
      appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          color: Colors.grey[900],
          elevation: 5.0),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white38,
        selectedIconTheme: IconThemeData(
          size: 30.0,
        ),
        unselectedIconTheme: IconThemeData(
          color: Colors.white38,
          size: 23.0,
        ),
        showSelectedLabels: true,
        elevation: 0.0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[900],
      ),
    );
