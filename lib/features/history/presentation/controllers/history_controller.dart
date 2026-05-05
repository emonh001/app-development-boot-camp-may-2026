import 'package:flutter/material.dart';

import '../../../expenses/presentation/data/models/expense_model.dart';
import '../../../expenses/presentation/data/models/history_group_model.dart';
import '../../../expenses/presentation/data/repositories/expense_repository.dart';
import '../../../profile/presentation/data/repositories/profile_repository.dart';



class HistoryController extends ChangeNotifier {
  HistoryController({
    ExpenseRepository? expenseRepository,
    ProfileRepository? profileRepository,
  })  : _expenseRepository = expenseRepository ?? ExpenseRepository(),
        _profileRepository = profileRepository ?? ProfileRepository();

  final ExpenseRepository _expenseRepository;
  final ProfileRepository _profileRepository;

  final searchController = TextEditingController();

  bool isLoading = false;
  String? errorMessage;

  String currencySymbol = r'$';

  List<HistoryGroupModel> historyGroups = [];

  Future<void> loadHistoryData({String searchText = ''}) async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      final profile = await _profileRepository.getProfile();
      currencySymbol = profile.currencySymbol;

      final expenses = await _expenseRepository.getExpensesForHistory(
        searchText: searchText,
      );

      historyGroups = _buildHistoryGroups(expenses);
    } catch (error) {
      errorMessage = 'Failed to load history';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void searchHistory(String value) {
    loadHistoryData(searchText: value);
  }

  Future<void> refreshHistoryData() async {
    await loadHistoryData(
      searchText: searchController.text,
    );
  }

  List<HistoryGroupModel> _buildHistoryGroups(List<ExpenseModel> expenses) {
    final Map<String, List<ExpenseModel>> groupedExpenses = {};

    for (final expense in expenses) {
      final expenseDate = DateTime.parse(expense.date);
      final dateKey = _getDateKey(expenseDate);

      groupedExpenses.putIfAbsent(dateKey, () => []);
      groupedExpenses[dateKey]!.add(expense);
    }

    return groupedExpenses.entries.map((entry) {
      final date = _parseDateKey(entry.key);
      final expenses = entry.value;

      return HistoryGroupModel(
        title: _getGroupTitle(date),
        totalAmount: _getTotalAmount(expenses),
        expenses: expenses,
      );
    }).toList();
  }

  double _getTotalAmount(List<ExpenseModel> expenses) {
    double total = 0;

    for (final expense in expenses) {
      total = total + expense.amount;
    }

    return total;
  }

  String _getDateKey(DateTime date) {
    final year = date.year.toString();
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');

    return '$year-$month-$day';
  }

  DateTime _parseDateKey(String dateKey) {
    final parts = dateKey.split('-');

    return DateTime(
      int.parse(parts[0]),
      int.parse(parts[1]),
      int.parse(parts[2]),
    );
  }

  String _getGroupTitle(DateTime date) {
    final now = DateTime.now();

    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final cleanDate = DateTime(date.year, date.month, date.day);

    if (cleanDate == today) {
      return 'Today';
    }

    if (cleanDate == yesterday) {
      return 'Yesterday';
    }

    return _formatMonthDay(date);
  }

  String _formatMonthDay(DateTime date) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];

    final month = months[date.month - 1];

    return '$month ${date.day}';
  }

  void disposeController() {
    searchController.dispose();
    dispose();
  }
}