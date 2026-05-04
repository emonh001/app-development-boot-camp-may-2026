import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:m_expense/features/common/presentation/widgets/show_snackbar.dart';

import '../../../../app/go_router/route_paths.dart';
import '../../../../app/theme/app_colors.dart';
import '../controllers/profile_controller.dart';
import '../widgets/account_settings_section.dart';
import '../widgets/app_version_text.dart';
import '../widgets/profile_action_tile.dart';
import '../widgets/profile_app_bar.dart';
import '../widgets/profile_header.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final ProfileController controller;

  @override
  void initState() {
    super.initState();
    controller = ProfileController();
  }

  @override
  void dispose() {
    controller.disposeController();
    super.dispose();
  }

  void _logout() {
    final message = controller.logout();
    ShowSnackbar.showMessage(context, message);


    context.go(RoutePaths.signin);
  }

  void _clearAllData() {
    final message = controller.clearAllData();

    ShowSnackbar.showMessage(context, message);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceContainerLowest,
      body: SafeArea(
        child: Column(
          children: [
            const ProfileAppBar(),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  children: [
                    const SizedBox(height: 24),

                    const ProfileHeader(),

                    const SizedBox(height: 32),

                    AccountSettingsSection(
                      controller: controller,
                    ),

                    const SizedBox(height: 18),

                    ProfileActionTile(
                      icon: Icons.logout,
                      title: 'Logout',
                      iconBackgroundColor: AppColors.primary.withValues(alpha: 0.12),
                      iconColor: AppColors.primary,
                      titleColor: AppColors.onPrimaryBlack,
                      trailingIcon: Icons.chevron_right,
                      onTap: _logout,
                    ),

                    const SizedBox(height: 14),

                    ProfileActionTile(
                      icon: Icons.delete_outline,
                      title: 'Clear All Data',
                      iconBackgroundColor: Colors.red.withValues(alpha: 0.08),
                      iconColor: Colors.red,
                      titleColor: Colors.red,
                      trailingIcon: Icons.warning_amber_outlined,
                      trailingColor: Colors.red,
                      borderColor: Colors.red.withValues(alpha: 0.12),
                      onTap: _clearAllData,
                    ),

                    const SizedBox(height: 40),

                    const AppVersionText(),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}