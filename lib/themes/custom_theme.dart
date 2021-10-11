import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTheme {
  static final lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    brightness: Brightness.light,
    primarySwatch: Colors.blue,
    textTheme: const TextTheme(
      headline6: TextStyle(color: Colors.black, fontSize: 26.0),
    ),
  );

  static final darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.black,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    brightness: Brightness.dark,
    primarySwatch: Colors.deepPurple,
    textTheme: const TextTheme(
      headline6: TextStyle(color: Colors.white, fontSize: 26.0),
    ),
  );
}
