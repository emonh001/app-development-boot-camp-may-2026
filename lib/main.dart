import 'package:flutter/material.dart';
import 'package:m_expense/app/m_expense.dart';
import 'package:m_expense/core/database/local_database_service.dart';
import 'package:m_expense/features/expenses/presentation/data/repositories/expense_repository.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = await LocalDatabaseService.instance.database;
  debugPrint('Database opened: ${database.path}');

  final repository = ExpenseRepository();


  final expenses = await repository.getAllExpenses();
  debugPrint('Total expenses: ${expenses.length}');

  runApp(const MExpense());
}