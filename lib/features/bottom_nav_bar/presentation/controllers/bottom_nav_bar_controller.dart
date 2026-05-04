import 'package:flutter/material.dart';

class BottomNavBarController extends ChangeNotifier {
  int selectedIndex = 0;

  void changeSelectedIndex(int index) {
    if (selectedIndex == index) return;

    selectedIndex = index;
    notifyListeners();
  }
}