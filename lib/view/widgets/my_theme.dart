import 'package:flutter/material.dart';

class MyTheme {
  static const Color burntSiennaColor = Color(0xffE76F51);

  ThemeData myThemeData() {
    return ThemeData(
        backgroundColor: Color(0xff264653),
        primaryColor: Color(0xffF4A261),
        scaffoldBackgroundColor: Colors.blueGrey.shade50,
        primarySwatch: Colors.blueGrey,
        appBarTheme: AppBarTheme(titleTextStyle: TextStyle(color: Colors.black), backgroundColor: Colors.white, elevation: 0, iconTheme: IconThemeData(color: Colors.black)),
        iconTheme: IconThemeData(color: Colors.black));
  }
}
