import 'package:flutter/material.dart';
import 'package:m_expense/app/m_expense.dart';
import 'package:m_expense/core/database/local_database_service.dart';
import 'package:m_expense/features/expenses/presentation/data/models/expense_model.dart';
import 'package:m_expense/features/expenses/presentation/data/repositories/expense_repository.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = await LocalDatabaseService.instance.database;
  debugPrint('Database opened: ${database.path}');

  final repository = ExpenseRepository();

  final expense = ExpenseModel(
    amount: 120,
    category: 'Food',
    note: 'Lunch',
    date: DateTime.now().toIso8601String(),
    createdAt: DateTime.now().toIso8601String(),
  );

  final id = await repository.insertExpense(expense);
  debugPrint('Inserted expense id: $id');

  final expenses = await repository.getAllExpenses();
  debugPrint('Total expenses: ${expenses.length}');

  runApp(const MExpense());
}