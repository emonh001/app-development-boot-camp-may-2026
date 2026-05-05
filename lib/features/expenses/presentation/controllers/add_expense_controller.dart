import 'package:flutter/material.dart';
import 'package:m_expense/features/expenses/presentation/data/models/expense_model.dart';

import '../data/repositories/expense_repository.dart';
import '../models/expense_category_model.dart';

class AddExpenseController extends ChangeNotifier {
  AddExpenseController({ExpenseRepository? expenseRepository})
    : _expenseRepository = expenseRepository ?? ExpenseRepository();
  final ExpenseRepository _expenseRepository;

  final formKey = GlobalKey<FormState>();

  final amountController = TextEditingController(text: '0.00');
  final noteController = TextEditingController();
  bool isSaving = false;

  DateTime selectedDate = DateTime.now();
  final List<ExpenseCategoryModel> categories = const [
    ExpenseCategoryModel(
      id: 'food',
      title: 'Food',
      icon: Icons.restaurant_outlined,
    ),
    ExpenseCategoryModel(
      id: 'transport',
      title: 'Transport',
      icon: Icons.directions_car_outlined,
    ),
    ExpenseCategoryModel(
      id: 'shopping',
      title: 'Shopping',
      icon: Icons.shopping_bag_outlined,
    ),
    ExpenseCategoryModel(
      id: 'health',
      title: 'Health',
      icon: Icons.medical_services_outlined,
    ),
    ExpenseCategoryModel(
      id: 'entertainment',
      title: 'Entertainment',
      icon: Icons.theater_comedy_outlined,
    ),
    ExpenseCategoryModel(
      id: 'others',
      title: 'Others',
      icon: Icons.grid_view_outlined,
    ),
  ];

  String selectedCategoryId = 'food';

  String get formattedDate {
    final month = selectedDate.month.toString().padLeft(2, '0');
    final day = selectedDate.day.toString().padLeft(2, '0');
    final year = selectedDate.year.toString();

    return '$month/$day/$year';
  }

  void changeCategory(String categoryId) {
    selectedCategoryId = categoryId;
    notifyListeners();
  }

  void changeDate(DateTime? date) {
    if (date == null) return;

    selectedDate = date;
    notifyListeners();
  }

  String? validateAmount(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Amount is required';
    }

    final amount = double.tryParse(value.trim());

    if (amount == null || amount <= 0) {
      return 'Enter a valid amount';
    }

    return null;
  }

  Future<String> saveExpense() async {
    final isValid = formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return 'Please enter a valid amount';
    }

    try {
      isSaving = true;
      notifyListeners();

      final expense = ExpenseModel(
        amount: double.parse(amountController.text.trim()),
        category: selectedCategoryId,
        note: noteController.text.trim(),
        date: selectedDate.toIso8601String(),
        createdAt: DateTime.now().toIso8601String(),
      );

      final insertedId = await _expenseRepository.insertExpense(expense);

      debugPrint('Inserted expense id: $insertedId');

      final allExpenses = await _expenseRepository.getAllExpenses();

      debugPrint('Total expenses in database: ${allExpenses.length}');

      _clearForm();

      return 'Expense saved successfully';
    } catch (error) {
      debugPrint('Save expense error: $error');
      return 'Failed to save expense';
    } finally {
      isSaving = false;
      notifyListeners();
    }
  }


  void _clearForm() {
    amountController.clear();
    noteController.clear();
    selectedCategoryId = 'food';
    amountController.text = "0.00";
    selectedDate = DateTime.now();
  }


  void disposeController() {
    amountController.dispose();
    noteController.dispose();
  }
}
