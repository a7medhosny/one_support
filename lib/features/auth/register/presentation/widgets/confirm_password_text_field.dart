import 'package:flutter/material.dart';

import '../../../../../core/helpers/app_validators.dart';
import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/widgets/app_text_form_field.dart';

class ConfirmPasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final TextEditingController passwordController;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;

  const ConfirmPasswordTextField({
    super.key,
    required this.controller,
    required this.passwordController,
    this.focusNode,
    this.onFieldSubmitted,
  });

  @override
  State<ConfirmPasswordTextField> createState() =>
      _ConfirmPasswordTextFieldState();
}

class _ConfirmPasswordTextFieldState extends State<ConfirmPasswordTextField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return AppTextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      labelText: context.l10n.confirmPassword,
      hintText: context.l10n.confirmPasswordHint,
      obscureText: _isObscured,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      autofillHints: const [AutofillHints.newPassword],
      prefixIcon: Icon(
        Icons.lock_outline_rounded,
        color: colorScheme.onSurfaceVariant,
      ),
      suffixIcon: IconButton(
        icon: Icon(
          _isObscured
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
          color: colorScheme.onSurfaceVariant,
        ),
        onPressed: () {
          setState(() {
            _isObscured = !_isObscured;
          });
        },
      ),
      validator: (value) => AppValidators.validateConfirmPassword(
        context,
        value,
        widget.passwordController.text,
      ),
      onFieldSubmitted: widget.onFieldSubmitted,
    );
  }
}
