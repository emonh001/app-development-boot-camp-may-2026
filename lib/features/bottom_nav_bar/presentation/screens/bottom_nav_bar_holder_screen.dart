import 'package:flutter/material.dart';

import '../../../expenses/presentation/screens/add_expense_screen.dart';
import '../../../history/presentation/screens/history_screen.dart';
import '../../../home/presentation/screens/home_screen.dart';
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

  void _goToHomeScreen() {
    controller.goToHome(refreshHome: true);
  }

  void _goToAddScreen() {
    controller.changeSelectedIndex(1);
  }

  void _goToHistoryScreen() {
    controller.changeSelectedIndex(2);
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
              HomeScreen(
                onViewAllTap: _goToHistoryScreen,
                onAddTap: _goToAddScreen,
                refreshKey: controller.homeRefreshKey,
              ),
              AddExpenseScreen(onBackTap: _goToHomeScreen),
              HistoryScreen(refreshKey: controller.historyRefreshKey),
              ProfileScreen(onDataChanged: controller.refreshHomeAndHistory),
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
