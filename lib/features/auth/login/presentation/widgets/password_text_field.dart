import 'package:flutter/material.dart';

import '../../../../../core/helpers/app_validators.dart';
import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/widgets/app_text_form_field.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;

  const PasswordTextField({
    super.key,
    required this.controller,
    this.focusNode,
    this.onFieldSubmitted,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;

    return AppTextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      labelText: context.l10n.password,
      hintText: context.l10n.passwordHint,
      obscureText: _isObscured,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      autofillHints: const [AutofillHints.password],
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
      validator: (value) => AppValidators.validatePassword(context, value),
      onFieldSubmitted: widget.onFieldSubmitted,
    );
  }
}
