import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:m_expense/app/go_router/route_paths.dart';

import '../controllers/splash_controller.dart';
import '../widgets/splash/app_logo_widget.dart';
import '../widgets/splash/app_title_widget.dart';
import '../widgets/splash/splash_loading_indicator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late SplashController _splashController;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    _splashController = SplashController(vsync: this);
    _splashController.startAnimation();
    _moveToNextScreen();
  }

  @override
  void dispose() {
    _splashController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFE),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(flex: 2),

              FadeTransition(
                opacity: _splashController.fadeInLogo,
                child: ScaleTransition(
                  scale: _splashController.scaleLogo,
                  child: const AppLogoWidget(),
                ),
              ),

              const SizedBox(height: 32),

              FadeTransition(
                opacity: _splashController.fadeInLogo,
                child: const AppTitleWidget(),
              ),

              const Spacer(flex: 3),

              const SplashLoadingIndicator(),
            ],
          ),
        ),
      ),
    );
  }

  void _moveToNextScreen() async {
    await Future.delayed(Duration(seconds: 3));
    context.go(RoutePaths.signup);
  }


}