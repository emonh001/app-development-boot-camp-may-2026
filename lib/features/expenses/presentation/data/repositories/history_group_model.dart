import '../models/expense_model.dart';

class HistoryGroupModel {
  const HistoryGroupModel({
    required this.title,
    required this.totalAmount,
    required this.expenses,
  });

  final String title;
  final String totalAmount;
  final List<ExpenseModel> expenses;
}