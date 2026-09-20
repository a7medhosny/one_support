import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../data/models/register_request_model.dart';
import '../cubit/register_cubit.dart';
import 'confirm_password_text_field.dart';
import 'email_text_field.dart';
import 'password_text_field.dart';
import 'phone_text_field.dart';
import 'register_button.dart';
import 'user_name_text_field.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _userNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;
  late final FocusNode _emailFocusNode;
  late final FocusNode _phoneFocusNode;
  late final FocusNode _passwordFocusNode;
  late final FocusNode _confirmPasswordFocusNode;

  @override
  void initState() {
    super.initState();
    _userNameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _emailFocusNode = FocusNode();
    _phoneFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _confirmPasswordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _emailFocusNode.dispose();
    _phoneFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  void _onRegisterPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      FocusScope.of(context).unfocus();
      final request = RegisterRequestModel(
        userName: _userNameController.text.trim(),
        email: _emailController.text.trim(),
        phone: _phoneController.text.trim(),
        password: _passwordController.text,
        confirmPassword: _confirmPasswordController.text,
      );
      context.read<RegisterCubit>().register(request);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          UserNameTextField(
            controller: _userNameController,
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(_emailFocusNode);
            },
          ),
          verticalSpace(16),
          EmailTextField(
            controller: _emailController,
            focusNode: _emailFocusNode,
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(_phoneFocusNode);
            },
          ),
          verticalSpace(16),
          PhoneTextField(
            controller: _phoneController,
            focusNode: _phoneFocusNode,
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(_passwordFocusNode);
            },
          ),
          verticalSpace(16),
          PasswordTextField(
            controller: _passwordController,
            focusNode: _passwordFocusNode,
            onFieldSubmitted: (_) {
              FocusScope.of(context).requestFocus(_confirmPasswordFocusNode);
            },
          ),
          verticalSpace(16),
          ConfirmPasswordTextField(
            controller: _confirmPasswordController,
            passwordController: _passwordController,
            focusNode: _confirmPasswordFocusNode,
            onFieldSubmitted: (_) => _onRegisterPressed(),
          ),
          verticalSpace(24),
          RegisterButton(onPressed: _onRegisterPressed),
        ],
      ),
    );
  }
}
