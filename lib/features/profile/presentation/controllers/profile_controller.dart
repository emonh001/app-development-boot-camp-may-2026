import 'dart:async';
import 'package:flutter/material.dart';
import '../../../expenses/presentation/data/repositories/expense_repository.dart';
import '../data/models/currency_option_model.dart';
import '../data/repositories/profile_repository.dart';

class ProfileController extends ChangeNotifier {
  ProfileController({
    ProfileRepository? profileRepository,
    ExpenseRepository? expenseRepository,
  })  : _profileRepository = profileRepository ?? ProfileRepository(),
        _expenseRepository = expenseRepository ?? ExpenseRepository();

  final ProfileRepository _profileRepository;
  final ExpenseRepository _expenseRepository;

  final monthlyBudgetController = TextEditingController();

  Timer? _budgetSaveTimer;

  bool isLoading = false;
  bool isClearingData = false;

  String? budgetErrorText;

  final List<CurrencyOptionModel> currencies = const [
    CurrencyOptionModel(
      code: 'USD',
      name: 'US Dollar',
      symbol: r'$',
    ),
    CurrencyOptionModel(
      code: 'BDT',
      name: 'Bangladeshi Taka',
      symbol: '৳',
    ),
    CurrencyOptionModel(
      code: 'EUR',
      name: 'Euro',
      symbol: '€',
    ),
    CurrencyOptionModel(
      code: 'GBP',
      name: 'British Pound',
      symbol: '£',
    ),
  ];

  String selectedCurrencyCode = 'USD';

  CurrencyOptionModel get selectedCurrency {
    return currencies.firstWhere(
          (currency) => currency.code == selectedCurrencyCode,
      orElse: () => currencies.first,
    );
  }

  Future<void> loadProfileData() async {
    try {
      isLoading = true;
      notifyListeners();

      final profile = await _profileRepository.getProfile();

      monthlyBudgetController.text = _formatBudget(profile.monthlyBudget);
      selectedCurrencyCode = profile.currencyCode;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void changeMonthlyBudget(String value) {
    budgetErrorText = null;
    notifyListeners();

    _budgetSaveTimer?.cancel();

    _budgetSaveTimer = Timer(
      const Duration(milliseconds: 600),
          () {
        saveMonthlyBudget();
      },
    );
  }

  Future<String> saveMonthlyBudget() async {
    final value = monthlyBudgetController.text.trim();
    final budget = double.tryParse(value);

    if (budget == null || budget <= 0) {
      budgetErrorText = 'Enter a valid budget';
      notifyListeners();
      return 'Enter a valid budget';
    }

    await _profileRepository.updateMonthlyBudget(budget);

    budgetErrorText = null;
    notifyListeners();

    return 'Monthly budget updated';
  }

  Future<String> changeCurrency(String? currencyCode) async {
    if (currencyCode == null) {
      return 'Currency not selected';
    }

    selectedCurrencyCode = currencyCode;
    notifyListeners();

    await _profileRepository.updateCurrency(selectedCurrency);

    return 'Currency updated';
  }

  Future<String> clearAllData() async {
    try {
      isClearingData = true;
      notifyListeners();

      await _expenseRepository.deleteAllExpenses();

      return 'All expense data cleared';
    } catch (error) {
      return 'Failed to clear data';
    } finally {
      isClearingData = false;
      notifyListeners();
    }
  }

  String _formatBudget(double value) {
    if (value == value.toInt()) {
      return value.toInt().toString();
    }

    return value.toStringAsFixed(2);
  }

  void disposeController() {
    _budgetSaveTimer?.cancel();
    monthlyBudgetController.dispose();
    dispose();
  }
}