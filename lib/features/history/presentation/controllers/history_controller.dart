import 'package:flutter/material.dart';
import '../../../expenses/presentation/data/models/expense_model.dart';
import '../../../expenses/presentation/data/repositories/expense_repository.dart';
import '../../../expenses/presentation/data/repositories/history_group_model.dart';


class HistoryController extends ChangeNotifier {
  HistoryController({
    ExpenseRepository? expenseRepository,
  }) : _expenseRepository = expenseRepository ?? ExpenseRepository();

  final ExpenseRepository _expenseRepository;

  final searchController = TextEditingController();

  bool isLoading = false;
  String? errorMessage;

  List<HistoryGroupModel> historyGroups = [];

  Future<void> loadHistoryData({String searchText = ''}) async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

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
        totalAmount: _getTotalAmountText(expenses),
        expenses: expenses,
      );
    }).toList();
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

  String _getTotalAmountText(List<ExpenseModel> expenses) {
    double total = 0;

    for (final expense in expenses) {
      total = total + expense.amount;
    }

    return '-\$${total.toStringAsFixed(2)}';
  }

  void disposeController() {
    searchController.dispose();
    dispose();
  }
}