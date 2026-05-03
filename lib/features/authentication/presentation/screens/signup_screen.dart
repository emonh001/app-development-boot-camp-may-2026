import 'package:flutter/material.dart';

import '../controllers/signup_controller.dart';
import '../widgets/signup/signup_card.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late final SignupController controller;

  @override
  void initState() {
    super.initState();
    controller = SignupController();
  }

  @override
  void dispose() {
    controller.disposeController();
    super.dispose();
  }

  void _handleSignup() {
    final message = controller.signup();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SignupCard(
              controller: controller,
              onSignupTap: _handleSignup,
            ),
          ),
        ),
      ),
    );
  }
}