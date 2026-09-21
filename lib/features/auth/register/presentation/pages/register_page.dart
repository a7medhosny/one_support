import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/get_it.dart';
import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/localization/cubit/localization_cubit.dart';
import '../../../../../core/localization/localization_constants.dart';
import '../../../../../core/theme/cubit/theme_cubit.dart';
import '../../../../../core/theme/cubit/theme_state.dart';
import '../cubit/register_cubit.dart';
import '../widgets/already_have_account_text.dart';
import '../widgets/register_bloc_listener.dart';
import '../widgets/register_form.dart';
import '../widgets/register_header.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<RegisterCubit>(),
      child: const _RegisterPageContent(),
    );
  }
}

class _RegisterPageContent extends StatelessWidget {
  const _RegisterPageContent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        actions: [
          // Theme Toggle
          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, themeState) {
              final isDark = context.isDarkMode;
              return IconButton(
                icon: Icon(
                  isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
                ),
                tooltip: isDark
                    ? context.l10n.switchToLight
                    : context.l10n.switchToDark,
                onPressed: () {
                  context.read<ThemeCubit>().toggleTheme();
                },
              );
            },
          ),
          // Language Switcher
          IconButton(
            icon: const Icon(Icons.language_rounded),
            tooltip: context.l10n.changeLanguage,
            onPressed: () {
              final locCubit = context.read<LocalizationCubit>();
              final isArabic =
                  locCubit.state.locale.languageCode ==
                  LocalizationConstants.arabicLanguageCode;
              locCubit.changeLanguage(
                isArabic
                    ? LocalizationConstants.englishLanguageCode
                    : LocalizationConstants.arabicLanguageCode,
              );
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          behavior: HitTestBehavior.opaque,
          child: RegisterBlocListener(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 480),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      verticalSpace(16),
                      const RegisterHeader(),
                      verticalSpace(32),
                      const RegisterForm(),
                      verticalSpace(24),
                      const AlreadyHaveAccountText(),
                      verticalSpace(24),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
