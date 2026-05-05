import 'package:flutter/material.dart';

class BottomNavBarController extends ChangeNotifier {
  int selectedIndex = 0;
  int homeRefreshKey = 0;

  void changeSelectedIndex(int index) {
    if (selectedIndex == index) {
      if (index == 0) {
        homeRefreshKey++;
        notifyListeners();
      }

      return;
    }

    selectedIndex = index;

    if (index == 0) {
      homeRefreshKey++;
    }

    notifyListeners();
  }

  void goToHome({bool refreshHome = false}) {
    selectedIndex = 0;

    if (refreshHome) {
      homeRefreshKey++;
    }

    notifyListeners();
  }
}