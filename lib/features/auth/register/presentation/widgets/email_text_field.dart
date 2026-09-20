import 'package:flutter/material.dart';

import '../../../../../core/helpers/app_validators.dart';
import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/widgets/app_text_form_field.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;

  const EmailTextField({
    super.key,
    required this.controller,
    this.focusNode,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return AppTextFormField(
      controller: controller,
      focusNode: focusNode,
      labelText: context.l10n.email,
      hintText: context.l10n.emailHint,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      autofillHints: const [AutofillHints.email],
      prefixIcon: Icon(
        Icons.email_outlined,
        color: context.colorScheme.onSurfaceVariant,
      ),
      validator: (value) => AppValidators.validateEmail(context, value),
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
