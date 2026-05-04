import 'package:flutter/material.dart';

class ProfileController extends ChangeNotifier {
  final monthlyBudgetController = TextEditingController(text: '2500');

  final List<String> currencies = const [
    'USD - US Dollar (\$)',
    'BDT - Bangladeshi Taka (৳)',
    'EUR - Euro (€)',
    'GBP - British Pound (£)',
  ];

  String selectedCurrency = 'USD - US Dollar (\$)';

  int selectedBottomNavIndex = 3;

  void changeCurrency(String? value) {
    if (value == null) return;

    selectedCurrency = value;
    notifyListeners();
  }

  void changeBottomNavIndex(int index) {
    selectedBottomNavIndex = index;
    notifyListeners();
  }

  String logout() {
    return 'Logged out successfully';
  }

  String clearAllData() {
    return 'All data cleared';
  }

  void disposeController() {
    monthlyBudgetController.dispose();
  }
}