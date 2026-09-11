import 'package:flutter/material.dart';

class ThemeApp{
  static ThemeData warmTheme(){
    final theme = ThemeData.dark().copyWith(
      colorScheme: ColorScheme(brightness: Brightness.dark, 
      primary: const Color.fromARGB(255, 183, 82, 41), 
      onPrimary: const Color.fromARGB(255, 255, 244, 226), 
      secondary: const Color.fromARGB(255, 245, 166, 35), 
      onSecondary: const Color.fromARGB(255, 65, 38, 18), 
      error: const Color.fromARGB(255, 206, 38, 26), 
      onError: const Color.fromARGB(255, 255, 235, 219), 
      surface: const Color.fromARGB(255, 54, 36, 28), 
      onSurface: const Color.fromARGB(255, 255, 239, 214))
    );
    return theme;
  } 
}
