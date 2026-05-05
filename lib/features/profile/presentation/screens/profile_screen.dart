import 'package:flutter/material.dart';

import '../../../../app/theme/app_colors.dart';
import '../controllers/profile_controller.dart';
import '../widgets/account_settings_section.dart';
import '../widgets/app_version_text.dart';
import '../widgets/profile_action_tile.dart';
import '../widgets/profile_app_bar.dart';
import '../widgets/profile_header.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
    this.onDataChanged,
  });

  final VoidCallback? onDataChanged;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final ProfileController controller;

  @override
  void initState() {
    super.initState();
    controller = ProfileController();
    controller.loadProfileData();
  }

  @override
  void dispose() {
    controller.disposeController();
    super.dispose();
  }

  Future<void> _clearAllData() async {
    final message = await controller.clearAllData();

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );

    if (message == 'All expense data cleared') {
      widget.onDataChanged?.call();
    }
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
                      onProfileChanged: widget.onDataChanged,
                    ),

                    const SizedBox(height: 18),

                    AnimatedBuilder(
                      animation: controller,
                      builder: (context, _) {
                        return ProfileActionTile(
                          icon: Icons.delete_outline,
                          title: controller.isClearingData
                              ? 'Clearing Data...'
                              : 'Clear All Data',
                          iconBackgroundColor:
                          Colors.red.withValues(alpha: 0.08),
                          iconColor: Colors.red,
                          titleColor: Colors.red,
                          trailingIcon: Icons.warning_amber_outlined,
                          trailingColor: Colors.red,
                          borderColor: Colors.red.withValues(alpha: 0.12),
                          onTap: controller.isClearingData
                              ? () {}
                              : _clearAllData,
                        );
                      },
                    ),

                    const SizedBox(height: 30),

                    const AppVersionText(),

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