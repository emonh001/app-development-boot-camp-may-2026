import 'package:m_expense/core/database/db_credentials.dart';
import 'package:m_expense/core/database/local_database_service.dart';
import 'package:m_expense/features/expenses/presentation/data/models/expense_model.dart';

class ExpenseRepository {
  final LocalDatabaseService _databaseService = LocalDatabaseService.instance;

  Future<int> insertExpense(ExpenseModel expense) async {
    final db = await _databaseService.database;

    return db.insert(DbCredentials.expensesTable, expense.toMap());
  }

  Future<List<ExpenseModel>> getAllExpenses() async {
    final db = await _databaseService.database;

    final result = await db.query(DbCredentials.expensesTable, orderBy: 'date DESC');
    
    return result.map((map) {
      return ExpenseModel.fromMap(map);
    }).toList();
  }

  Future<int> updateExpense(ExpenseModel expense) async {
    final db = await _databaseService.database;

    return db.update(DbCredentials.expensesTable, expense.toMap(), where: "id = ?", whereArgs: [expense.id]);
  }

  Future<int> deleteExpense(int id) async {
    final db = await _databaseService.database;

    return db.delete(DbCredentials.expensesTable, where: "id = ?", whereArgs: [id]);
  }

  Future<int> deleteAllExpense() async {
    final db = await _databaseService.database;

    return db.delete(DbCredentials.expensesTable);
  }

}