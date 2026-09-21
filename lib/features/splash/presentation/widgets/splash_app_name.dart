import 'package:flutter/material.dart';
import 'package:one_support/core/helpers/extensions.dart';

class SplashAppName extends StatelessWidget {
  const SplashAppName({super.key});

  @override
  Widget build(BuildContext context) {
    final appTitle = context.l10n.appTitle;
    final parts = appTitle.split(' ');
    final firstWord = parts.first;
    final secondWord = parts.skip(1).join(' ');
    final colorScheme = context.colorScheme;
    final textTheme = context.textTheme;
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: firstWord,
            style: textTheme.headlineLarge?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 52,
                ),
          ),
          TextSpan(
            text: secondWord,
            style: textTheme.headlineLarge?.copyWith(
                  color: colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                  fontSize: 52,
                ),
          ),
        ],
      ),
    );
  }
}