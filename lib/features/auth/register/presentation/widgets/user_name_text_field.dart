import 'package:flutter/material.dart';

import '../../../../../core/helpers/app_validators.dart';
import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/widgets/app_text_form_field.dart';

class UserNameTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;

  const UserNameTextField({
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
      labelText: context.l10n.userName,
      hintText: context.l10n.userNameHint,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      autofillHints: const [AutofillHints.name],
      prefixIcon: Icon(
        Icons.person_outline_rounded,
        color: context.colorScheme.onSurfaceVariant,
      ),
      validator: (value) => AppValidators.validateUserName(context, value),
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
