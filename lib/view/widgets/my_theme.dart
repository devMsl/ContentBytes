import 'package:flutter/material.dart';

class MyTheme {
  static const Color burntSiennaColor = Color(0xffE76F51);

  ThemeData myThemeData() {
    return ThemeData(
        backgroundColor: const Color(0xff264653),
        primaryColor: const Color(0xffF4A261),
        scaffoldBackgroundColor: Colors.blueGrey.shade50,
        primarySwatch: Colors.blueGrey,
        appBarTheme: const AppBarTheme(titleTextStyle: TextStyle(color: Colors.black), backgroundColor: Colors.white, elevation: 0, iconTheme: IconThemeData(color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.black));
  }
}
