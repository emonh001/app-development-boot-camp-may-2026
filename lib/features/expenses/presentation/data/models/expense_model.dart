class ExpenseModel {
  final int? id;
  final double amount;
  final String category;
  final String note;
  final String date;
  final String createdAt;

  const ExpenseModel({
    this.id,
    required this.amount,
    required this.category,
    required this.note,
    required this.date,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'amount': amount,
      'category': category,
      'note': note,
      'date': date,
      'createdAt': createdAt,
    };
  }

  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
    return ExpenseModel(
      id: map['id'] as int?,
      amount: map['amount'] as double,
      category: map['category'] as String,
      note: map['note'] as String,
      date: map['date'] as String,
      createdAt: map['createdAt'] as String,
    );
  }
}