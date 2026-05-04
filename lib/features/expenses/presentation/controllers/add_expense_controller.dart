import 'package:flutter/material.dart';

import '../models/expense_category_model.dart';

class AddExpenseController extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  final amountController = TextEditingController(text: '0.00');
  final noteController = TextEditingController();

  DateTime selectedDate = DateTime(2023, 11, 20);

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

  String saveExpense() {
    final isValid = formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return 'Please enter a valid amount';
    }

    return 'Expense saved successfully';
  }

  void disposeController() {
    amountController.dispose();
    noteController.dispose();
  }
}