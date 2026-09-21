import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/helpers/extensions.dart';

class SplashDescription extends StatelessWidget {
  const SplashDescription({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final textTheme = context.textTheme;
    return AnimatedTextKit(
      totalRepeatCount: 1,
      animatedTexts: [
        TypewriterAnimatedText(
          context.l10n.appDescription,
          speed: const Duration(milliseconds: 100),
          cursor: '|',
          textStyle: textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w800,
            letterSpacing: 1.5,
            color: colorScheme.secondary,
            shadows: [
              Shadow(
                blurRadius: 12,
                color: colorScheme.secondary.withValues(alpha: 0.20),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
