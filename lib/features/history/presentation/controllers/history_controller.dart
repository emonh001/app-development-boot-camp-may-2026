import 'package:flutter/material.dart';

import '../models/history_transaction_model.dart';

class HistoryController {
  final searchController = TextEditingController();

  final List<HistoryTransactionModel> todayTransactions = const [
    HistoryTransactionModel(
      title: 'Lunch at Blue Bay',
      subtitle: 'Food & Dining • 12:45 PM',
      amount: '-\$24.50',
      icon: Icons.restaurant_outlined,
      type: HistoryTransactionType.expense,
    ),
    HistoryTransactionModel(
      title: 'Weekly Groceries',
      subtitle: 'Shopping • 10:20 AM',
      amount: '-\$118.00',
      icon: Icons.shopping_bag_outlined,
      type: HistoryTransactionType.expense,
    ),
  ];

  final List<HistoryTransactionModel> yesterdayTransactions = const [
    HistoryTransactionModel(
      title: 'Salary Deposit',
      subtitle: 'Income • 09:00 AM',
      amount: '+\$1,300.00',
      icon: Icons.payments_outlined,
      type: HistoryTransactionType.income,
    ),
    HistoryTransactionModel(
      title: 'Fuel Refill',
      subtitle: 'Transport • 06:15 PM',
      amount: '-\$50.00',
      icon: Icons.directions_car_outlined,
      type: HistoryTransactionType.expense,
    ),
  ];

  final List<HistoryTransactionModel> octoberTransactions = const [
    HistoryTransactionModel(
      title: 'Streaming Service',
      subtitle: 'Entertainment • 11:00 AM',
      amount: '-\$12.99',
      icon: Icons.subscriptions_outlined,
      type: HistoryTransactionType.expense,
    ),
  ];

  void disposeController() {
    searchController.dispose();
  }
}