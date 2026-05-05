import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../controllers/home_controller.dart';
import '../widgets/add_transaction_fab.dart';
import '../widgets/empty_recent_transactions.dart';
import '../widgets/expense_summary_card.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/recent_transactions_header.dart';
import '../widgets/transaction_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.onAddTap,
    required this.refreshKey,
  });

  final VoidCallback onAddTap;
  final int refreshKey;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeController controller;

  @override
  void initState() {
    super.initState();
    controller = HomeController();
    controller.loadHomeData();
  }

  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.refreshKey != widget.refreshKey) {
      controller.loadHomeData();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _viewAllTransactions() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Go to History tab')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceContainerLowest,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                const HomeAppBar(),

                Expanded(
                  child: AnimatedBuilder(
                    animation: controller,
                    builder: (context, _) {
                      if (controller.isLoading &&
                          controller.recentExpenses.isEmpty) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primary,
                          ),
                        );
                      }

                      return RefreshIndicator(
                        color: AppColors.primary,
                        onRefresh: controller.refreshHomeData,
                        child: SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          padding: const EdgeInsets.fromLTRB(18, 20, 18, 110),
                          child: Column(
                            children: [
                              ExpenseSummaryCard(
                                totalExpense: controller.totalExpenseText,
                                remainingBudget:
                                controller.remainingBudgetText,
                                monthName: controller.monthName,
                                percentageText: controller.percentageText,
                              ),

                              const SizedBox(height: 26),

                              RecentTransactionsHeader(
                                onViewAllTap: _viewAllTransactions,
                              ),

                              const SizedBox(height: 14),

                              if (controller.errorMessage != null)
                                Text(
                                  controller.errorMessage!,
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                )
                              else if (controller.recentExpenses.isEmpty)
                                const EmptyRecentTransactions()
                              else
                                ListView.separated(
                                  shrinkWrap: true,
                                  physics:
                                  const NeverScrollableScrollPhysics(),
                                  itemCount:
                                  controller.recentExpenses.length,
                                  separatorBuilder: (_, __) {
                                    return const SizedBox(height: 14);
                                  },
                                  itemBuilder: (context, index) {
                                    return TransactionTile(
                                      expense:
                                      controller.recentExpenses[index],
                                    );
                                  },
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),

            Positioned(
              right: 18,
              bottom: 28,
              child: AddTransactionFab(
                onTap: widget.onAddTap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}