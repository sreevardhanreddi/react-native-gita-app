import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData.light();
ThemeData sepiaTheme = ThemeData(
  primaryColor: Colors.amber,
  accentColor: Colors.amber,
  appBarTheme: AppBarTheme(
    color: Colors.amber,
  ),
  backgroundColor: Color.fromRGBO(251, 248, 238, 1),
  textTheme: TextTheme(
    body1: TextStyle(
      color: Color.fromRGBO(123, 104, 125, 1),
    ),
  ),
);
ThemeData darkTheme = ThemeData.dark();

List<ThemeData> appThemes = [lightTheme, sepiaTheme, darkTheme];
