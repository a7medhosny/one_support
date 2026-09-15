import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/di/get_it.dart';
import 'core/localization/localization_exports.dart';
import 'core/routing/app_router.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/cubit/theme_cubit.dart';
import 'core/theme/cubit/theme_state.dart';

class OneSupportApp extends StatelessWidget {
  const OneSupportApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<ThemeCubit>()),
        BlocProvider(create: (_) => getIt<LocalizationCubit>()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          return BlocBuilder<LocalizationCubit, LocalizationState>(
            builder: (context, localizationState) {
              return MaterialApp.router(
                title: 'One Support',
                debugShowCheckedModeBanner: false,

                // Theme
                theme: AppTheme.light,
                darkTheme: AppTheme.dark,
                themeMode: themeState.themeMode,

                // Localization
                locale: localizationState.locale,
                supportedLocales: LocalizationConstants.supportedLocales,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                localeResolutionCallback: (locale, supportedLocales) {
                  if (locale == null) {
                    return LocalizationConstants.defaultLocale;
                  }

                  return supportedLocales.firstWhere(
                    (supportedLocale) =>
                        supportedLocale.languageCode == locale.languageCode,
                    orElse: () => LocalizationConstants.defaultLocale,
                  );
                },

                routerConfig: appRouter,
              );
            },
          );
        },
      ),
    );
  }
}
