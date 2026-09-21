import 'package:flutter/material.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/logo/app_logo.png',
      width: 170,
      height: 170,
      fit: BoxFit.contain,
    );
  }
}