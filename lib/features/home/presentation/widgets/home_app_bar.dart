import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/di/get_it.dart';
import '../../../../../core/helpers/extensions.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/localization/cubit/localization_cubit.dart';
import '../../../../../core/localization/localization_constants.dart';
import '../../../../../core/routing/app_routes.dart';
import '../../../../../core/storage/preferences/preferences_constants.dart';
import '../../../../../core/storage/preferences/preferences_service.dart';
import '../../../../../core/storage/secure_storage/secure_storage_service.dart';
import '../../../../../core/theme/cubit/theme_cubit.dart';
import '../../../../../core/theme/cubit/theme_state.dart';
import '../../../../core/networking/dio_factory.dart';

/// App bar widget for the Home screen with actions for theme, language, and logout.
class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  Future<void> _showLogoutDialog(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(dialogContext.l10n.logout),
          content: Text(dialogContext.l10n.logoutConfirmation),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: Text(dialogContext.l10n.cancel),
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: dialogContext.colorScheme.error,
              ),
              onPressed: () => Navigator.of(dialogContext).pop(true),
              child: Text(dialogContext.l10n.logout),
            ),
          ],
        );
      },
    );

    if (confirmed == true) {
      await getIt<SecureStorageService>().clear();
      DioFactory.removeTokenFromHeaderAfterLogout();
      if (context.mounted) {
        context.go(AppRoutes.login);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final userName = getIt<PreferencesService>().getString(
      PreferencesConstants.userName,
    );

    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.support_agent_rounded,
              color: colorScheme.primary,
              size: 22,
            ),
          ),
          horizontalSpace(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                context.l10n.appTitle,
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
              if (userName != null && userName.isNotEmpty)
                Text(
                  userName,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w500,
                  ),
                ),
            ],
          ),
        ],
      ),
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
        // Logout Button
        IconButton(
          icon: const Icon(Icons.logout_rounded),
          tooltip: context.l10n.logout,
          onPressed: () => _showLogoutDialog(context),
        ),
        const SizedBox(width: 4),
      ],
    );
  }
}
