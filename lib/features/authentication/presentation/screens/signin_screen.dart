import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:m_expense/app/theme/app_colors.dart';

import '../../../../app/go_router/route_paths.dart';
import '../controllers/signin_controller.dart';
import '../widgets/signin/signin_card.dart';
import '../widgets/signin/signin_form.dart';


class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});


  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  late final SigninController controller;

  @override
  void initState() {
    super.initState();
    controller = SigninController();
  }

  @override
  void dispose() {
    controller.disposeController();
    super.dispose();
  }

  void _signin() {
    final message = controller.signin();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SigninCard(
                      controller: controller,
                      onSigninTap: (){},
                      onCreateAccountTap: () => context.go(RoutePaths.signup),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

/*
SigninForm(
                      controller: controller,
                      onSigninTap: _signin,
                    )
*/