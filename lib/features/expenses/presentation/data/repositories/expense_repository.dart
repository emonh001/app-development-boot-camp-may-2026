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

  Future<List<ExpenseModel>> getRecentExpenses({int limit = 4}) async {
    final db = await _databaseService.database;

    final result = await db.query(DbCredentials.expensesTable, orderBy: 'createdAt DESC', limit: limit);

    return result.map((map){
      return ExpenseModel.fromMap(map);
    }).toList();
  }

  Future<double> getTotalExpenseForMonth(DateTime month) async {
    final db = await _databaseService.database;

    final startDate = DateTime(month.year, month.month, 1);
    final endDate = DateTime(month.year, month.month + 1, 1);

    final result = await db.rawQuery(
      '''
      SELECT SUM(amount) as total
      FROM expenses
      WHERE date >= ? AND date < ?
      ''',
      [
        startDate.toIso8601String(),
        endDate.toIso8601String(),
      ],
    );

    final total = result.first['total'];

    if (total == null) {
      return 0;
    }

    return (total as num).toDouble();
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