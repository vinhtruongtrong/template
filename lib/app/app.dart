/*
 * @Author: vinhtruongtrong 
 * @Date: 2021-11-23 10:22:28 
 * @Last Modified by: vinhtruongtrong
 * @Last Modified time: 2021-11-25 13:21:36
 */
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template/app/app_settings.dart';
import 'package:template/app/routes/router.dart';
import 'package:template/core/src/widgets/network_observer/network_observer.dart';
import 'package:template/generated/l10n/l10n.dart';

import 'theme/app_theme.dart';

class App extends HookConsumerWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = useMemoized(() => AppRouter());
    final appSettings = ref.watch(appSettingsProvider);
    useEffect(
      () {
        appSettings.loadAppSettings();
      },
      [],
    );
    return MaterialApp.router(
      theme: AppTheme.light().data,
      darkTheme: AppTheme.dark().data,
      themeMode: appSettings.themeMode,
      localizationsDelegates: L10n.localizationsDelegates,
      supportedLocales: L10n.supportedLocales,
      locale: appSettings.locale,
      routeInformationParser: appRouter.defaultRouteParser(),
      routerDelegate: appRouter.delegate(),
      builder: (context, child) {
        return NetworkObserver(
          child: child ?? const Placeholder(),
        );
      },
    );
  }
}

final appThemeModeProvider =
    ChangeNotifierProvider<ValueNotifier<ThemeMode>>((ref) {
  return ValueNotifier<ThemeMode>(ThemeMode.light);
});

final appLocaleProvider = ChangeNotifierProvider<ValueNotifier<Locale>>((ref) {
  return ValueNotifier(const Locale('en'));
});
