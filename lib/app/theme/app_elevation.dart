import 'package:flutter/material.dart';

class AppElevation {
  AppElevation._();

  // Surface levels
  static const double level0 = 0.0;    // Background
  static const double level1 = 1.0;    // Cards
  static const double level2 = 3.0;    // Elevated elements
  static const double level3 = 6.0;    // Modals/Dialogs
  static const double level4 = 8.0;    // Navigation drawer
  static const double level5 = 12.0;   // FAB

  // Overlay colors
  static Color surfaceTintColor = Colors.transparent;
  static Color shadowColor = const Color(0xFF312E81);
}