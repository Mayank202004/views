import 'package:flutter/material.dart';

final ThemeData theme = ThemeData(
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    elevation: 0.0,
    surfaceTintColor: Colors.black,
  ),
  //brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    brightness: Brightness.dark,
    surface: Colors.black,
    onSurface: Colors.white,
    surfaceTint: Colors.black12,
    primary: Colors.white,
    onPrimary: Colors.black,

  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(Colors.white),
      foregroundColor: WidgetStateProperty.all(Colors.black),
    )
  ),
  navigationBarTheme: const NavigationBarThemeData(
    labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
    height: 60,
    //indicatorColor: Colors.pink,
  )
);