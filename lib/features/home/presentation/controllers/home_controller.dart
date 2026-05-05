import 'package:flutter/material.dart';

import '../../../expenses/presentation/data/models/expense_model.dart';
import '../../../expenses/presentation/data/repositories/expense_repository.dart';



class HomeController extends ChangeNotifier {
  HomeController({
    ExpenseRepository? expenseRepository,
  }) : _expenseRepository = expenseRepository ?? ExpenseRepository();

  final ExpenseRepository _expenseRepository;

  bool isLoading = false;
  String? errorMessage;

  List<ExpenseModel> recentExpenses = [];

  double monthlyBudget = 2500;
  double totalExpense = 0;

  String get monthName {
    final now = DateTime.now();

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

    return months[now.month - 1];
  }

  String get totalExpenseText {
    return _formatCurrency(totalExpense);
  }

  String get remainingBudgetText {
    final remaining = monthlyBudget - totalExpense;
    return _formatCurrency(remaining);
  }

  String get percentageText {
    if (monthlyBudget <= 0) {
      return '0% of budget used';
    }

    final percentage = (totalExpense / monthlyBudget) * 100;
    return '${percentage.toStringAsFixed(0)}% of budget used';
  }

  Future<void> loadHomeData() async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      recentExpenses = await _expenseRepository.getRecentExpenses(limit: 4);
      totalExpense = await _expenseRepository.getTotalExpenseForMonth(
        DateTime.now(),
      );
    } catch (error) {
      errorMessage = 'Failed to load home data';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> refreshHomeData() async {
    await loadHomeData();
  }

  String _formatCurrency(double value) {
    return '\$${value.toStringAsFixed(2)}';
  }
}