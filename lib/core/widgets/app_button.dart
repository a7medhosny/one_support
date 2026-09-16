import 'package:flutter/material.dart';

import '../helpers/extensions.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final double? width;
  final double height;
  final double borderRadius;
  final Color? backgroundColor;
  final Color? textColor;
  final TextStyle? textStyle;
  final Widget? icon;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.width = double.infinity,
    this.height = 50,
    this.borderRadius = 12,
    this.backgroundColor,
    this.textColor,
    this.textStyle,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final textTheme = context.textTheme;

    final effectiveBackgroundColor = backgroundColor ?? colorScheme.primary;
    final effectiveTextColor = textColor ?? colorScheme.onPrimary;

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: effectiveBackgroundColor,
          foregroundColor: effectiveTextColor,
          disabledBackgroundColor: effectiveBackgroundColor.withValues(
            alpha: 0.6,
          ),
          disabledForegroundColor: effectiveTextColor.withValues(alpha: 0.8),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        child: isLoading
            ? SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator.adaptive(
                  strokeWidth: 2.5,
                  valueColor: AlwaysStoppedAnimation<Color>(effectiveTextColor),
                ),
              )
            : (icon != null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        icon!,
                        const SizedBox(width: 8),
                        Text(
                          text,
                          style:
                              textStyle ??
                              textTheme.titleMedium?.copyWith(
                                color: effectiveTextColor,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                      ],
                    )
                  : Text(
                      text,
                      style:
                          textStyle ??
                          textTheme.titleMedium?.copyWith(
                            color: effectiveTextColor,
                            fontWeight: FontWeight.w600,
                          ),
                    )),
      ),
    );
  }
}
