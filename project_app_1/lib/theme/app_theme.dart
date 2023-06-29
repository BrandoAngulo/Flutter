import 'package:flutter/material.dart';

//Es estatic const por que no cambia en el momento de la ejecucion
class AppTheme {
  static const Color primary = Colors.deepOrange;

  static final themeLight = ThemeData.light().copyWith(
      //color primario
      primaryColor: Colors.deepOrange,
      //tema del appBar
      appBarTheme: const AppBarTheme(color: primary, elevation: 0),

      //Style para todos los botones de la app
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: primary)),

      //floattingActionBotton
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: primary, elevation: 10, splashColor: Colors.black12),

      //elevatedButton
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        shape: const StadiumBorder(),
      )));

//Dark Theme
  static final darkTheme = ThemeData.dark().copyWith(
    //color primario
    primaryColor: Colors.deepOrange,
    //tema del appBar
    appBarTheme: const AppBarTheme(color: primary, elevation: 0),
    //background del scaffold
      scaffoldBackgroundColor: Colors.black,
      //floattingActionBotton
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.amber,
          elevation: 10,
          splashColor: Colors.black12)
  );  
}
