import 'package:flutter/material.dart';

class BottomNavBarController extends ChangeNotifier {
  int selectedIndex = 0;

  int homeRefreshKey = 0;
  int historyRefreshKey = 0;

  void changeSelectedIndex(int index) {
    if (selectedIndex == index) {
      _refreshCurrentTab(index);
      notifyListeners();
      return;
    }

    selectedIndex = index;
    _refreshCurrentTab(index);

    notifyListeners();
  }

  void goToHome({bool refreshHome = false}) {
    selectedIndex = 0;

    if (refreshHome) {
      homeRefreshKey++;
    }

    notifyListeners();
  }

  void refreshHomeAndHistory() {
    homeRefreshKey++;
    historyRefreshKey++;

    notifyListeners();
  }

  void _refreshCurrentTab(int index) {
    if (index == 0) {
      homeRefreshKey++;
    }

    if (index == 2) {
      historyRefreshKey++;
    }
  }
}