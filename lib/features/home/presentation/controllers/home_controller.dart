import '../models/transaction_item_model.dart';

class HomeController {
  final String monthName = 'September';
  final String totalExpense = '\$4,285.50';
  final String remainingBudget = '\$1,714.50';
  final String percentageText = '12% from last month';

  final List<TransactionItemModel> transactions = const [
    TransactionItemModel(
      title: 'Groceries & Home',
      date: 'Sep 12, 2023',
      amount: '-\$84.20',
      icon: 'shopping_bag',
      type: TransactionType.expense,
    ),
    TransactionItemModel(
      title: 'Artisanal Bakery',
      date: 'Sep 11, 2023',
      amount: '-\$12.50',
      icon: 'restaurant',
      type: TransactionType.expense,
    ),
    TransactionItemModel(
      title: 'Fuel Refill',
      date: 'Sep 10, 2023',
      amount: '-\$56.00',
      icon: 'car',
      type: TransactionType.expense,
    ),
    TransactionItemModel(
      title: 'Freelance Payout',
      date: 'Sep 09, 2023',
      amount: '+\$1,200.00',
      icon: 'money',
      type: TransactionType.income,
    ),
  ];
}