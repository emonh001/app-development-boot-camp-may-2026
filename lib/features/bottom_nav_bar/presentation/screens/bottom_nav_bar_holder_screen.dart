import 'package:flutter/material.dart';
import 'package:m_expense/features/home/presentation/screens/home_screen.dart';

import '../../../expenses/presentation/screens/add_expense_screen.dart';
import '../../../profile/presentation/screens/profile_screen.dart';
import '../controllers/bottom_nav_bar_controller.dart';
import '../widgets/app_bottom_nav_bar.dart';

class BottomNavBarHolderScreen extends StatefulWidget {
  const BottomNavBarHolderScreen({super.key});

  @override
  State<BottomNavBarHolderScreen> createState() =>
      _BottomNavBarHolderScreenState();
}

class _BottomNavBarHolderScreenState extends State<BottomNavBarHolderScreen> {
  late final BottomNavBarController controller;

  @override
  void initState() {
    super.initState();
    controller = BottomNavBarController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _changeScreen(int index) {
    controller.changeSelectedIndex(index);
  }

  void _goToAddScreen() {
    controller.changeSelectedIndex(1);
  }

  void _goToHomeScreen() {
    controller.changeSelectedIndex(0);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return Scaffold(
          body: IndexedStack(
            index: controller.selectedIndex,
            children: [
              HomeScreen(onAddTap: _goToAddScreen),
              AddExpenseScreen(
                onBackTap: _goToHomeScreen,
              ),
              _HistoryScreenPlaceholder(),
              ProfileScreen(),
            ],
          ),
          bottomNavigationBar: AppBottomNavBar(
            selectedIndex: controller.selectedIndex,
            onTap: _changeScreen,
          ),
        );
      },
    );
  }
}


class _AddExpenseScreenPlaceholder extends StatelessWidget {
  const _AddExpenseScreenPlaceholder();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Add Expense Screen'),
    );
  }
}

class _HistoryScreenPlaceholder extends StatelessWidget {
  const _HistoryScreenPlaceholder();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('History Screen'),
    );
  }
}