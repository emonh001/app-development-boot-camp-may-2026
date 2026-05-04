enum TransactionType {
  income,
  expense,
}

class TransactionItemModel {
  final String title;
  final String date;
  final String amount;
  final String icon;
  final TransactionType type;

  const TransactionItemModel({
    required this.title,
    required this.date,
    required this.amount,
    required this.icon,
    required this.type,
  });
}