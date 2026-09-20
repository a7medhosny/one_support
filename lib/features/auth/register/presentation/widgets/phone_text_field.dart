import 'package:flutter/material.dart';

import '../../../../../core/helpers/app_validators.dart';
import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/widgets/app_text_form_field.dart';

class PhoneTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;

  const PhoneTextField({
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
      labelText: context.l10n.phone,
      hintText: context.l10n.phoneHint,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.next,
      autofillHints: const [AutofillHints.telephoneNumber],
      prefixIcon: Icon(
        Icons.phone_outlined,
        color: context.colorScheme.onSurfaceVariant,
      ),
      validator: (value) => AppValidators.validatePhone(context, value),
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
