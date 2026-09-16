import 'package:flutter/material.dart';

import '../helpers/extensions.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final bool enabled;
  final bool readOnly;
  final bool autofocus;
  final Iterable<String>? autofillHints;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final Color? fillColor;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final int maxLines;

  const AppTextFormField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.focusNode,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.autofillHints,
    this.contentPadding,
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    this.fillColor,
    this.hintStyle,
    this.style,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final textTheme = context.textTheme;

    final defaultBorderRadius = BorderRadius.circular(12);

    final defaultEnabledBorder = OutlineInputBorder(
      borderRadius: defaultBorderRadius,
      borderSide: BorderSide(color: colorScheme.outlineVariant, width: 1.0),
    );

    final defaultFocusedBorder = OutlineInputBorder(
      borderRadius: defaultBorderRadius,
      borderSide: BorderSide(color: colorScheme.primary, width: 1.5),
    );

    final defaultErrorBorder = OutlineInputBorder(
      borderRadius: defaultBorderRadius,
      borderSide: BorderSide(color: colorScheme.error, width: 1.0),
    );

    final defaultFocusedErrorBorder = OutlineInputBorder(
      borderRadius: defaultBorderRadius,
      borderSide: BorderSide(color: colorScheme.error, width: 1.5),
    );

    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
      focusNode: focusNode,
      enabled: enabled,
      readOnly: readOnly,
      autofocus: autofocus,
      autofillHints: autofillHints,
      maxLines: maxLines,
      style:
          style ?? textTheme.bodyMedium?.copyWith(color: colorScheme.onSurface),
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor:
            fillColor ??
            (context.isDarkMode
                ? colorScheme.surfaceContainerHighest.withValues(alpha: 0.3)
                : colorScheme.surfaceContainerHighest.withValues(alpha: 0.2)),
        contentPadding:
            contentPadding ??
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        hintText: hintText,
        hintStyle:
            hintStyle ??
            textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
            ),
        labelText: labelText,
        labelStyle: textTheme.bodyMedium?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabledBorder: enabledBorder ?? defaultEnabledBorder,
        focusedBorder: focusedBorder ?? defaultFocusedBorder,
        errorBorder: errorBorder ?? defaultErrorBorder,
        focusedErrorBorder: focusedErrorBorder ?? defaultFocusedErrorBorder,
        disabledBorder: OutlineInputBorder(
          borderRadius: defaultBorderRadius,
          borderSide: BorderSide(
            color: colorScheme.outlineVariant.withValues(alpha: 0.5),
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
