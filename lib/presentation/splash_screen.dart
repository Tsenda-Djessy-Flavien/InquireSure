import 'package:analyse_gp/presentation/onboarding.dart';
import 'package:analyse_gp/utils/colors.dart';
import 'package:analyse_gp/utils/images.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

class SplachScreen extends StatelessWidget {
  const SplachScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 3000,
      splash: KorangeLogo,
      splashIconSize: 100,
      nextScreen: const OnBoarding(),
      backgroundColor: appSectionBackground,
    );
  }
}
