import 'package:flutter/material.dart';

//Es estatic const por que no cambia en el momento de la ejecucion
class AppTheme {
  static const Color primary = Colors.deepOrange;

  static final themeLight = ThemeData.light().copyWith(
    //color primario
    primaryColor: Colors.deepOrange,
    //tema del appBar
    appBarTheme: const AppBarTheme(color: primary, elevation: 0),
  );

    static final darkTheme = ThemeData.dark().copyWith(
    //color primario
    primaryColor: Colors.deepOrange,
    //tema del appBar
    appBarTheme: const AppBarTheme(color: primary, elevation: 0),
    //background del scaffold
    scaffoldBackgroundColor: Colors.black,
  );
}

