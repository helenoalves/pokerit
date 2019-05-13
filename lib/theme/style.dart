import 'package:flutter/material.dart';

ThemeData appTheme() {
  return ThemeData(
      primaryColor: Colors.yellow[600],
      accentColor: Colors.orange,
      backgroundColor: Colors.yellow[600],
      brightness: Brightness.dark,
      fontFamily: 'Montserrat',
      textTheme: TextTheme(
        headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        title: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
      ));
}
