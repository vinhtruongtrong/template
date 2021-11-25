import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:settings/presentation/settings/viewmodel.dart';
import 'package:template/app/app_settings.dart';
import 'package:template/core/core.dart';
import 'package:template/core/src/hooks/use_router.dart';
import 'package:template/generated/l10n/l10n.dart';

class SettingsPage extends HookConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(appSettingsProvider);
    final viewModel = ref.read(settingsViewModelProvider);
    final router = useRouter();
    final l10n = useL10n();
    return Scaffold(
      body: ListView(
        children: [
          Consumer(
            builder: (_, ref, __) {
              final themeMode = ref.watch(
                appSettingsProvider.select((value) => value.themeMode),
              );
              return SwitchListTile(
                title: Text(l10n.darkMode),
                subtitle: Text(l10n.darkModeDescription),
                value: themeMode == ThemeMode.dark,
                onChanged: (bool value) {
                  provider.changeAppThemeMode(
                    themeMode: value ? ThemeMode.dark : ThemeMode.light,
                  );
                },
              );
            },
          ),
          ListTile(
            title: Text(l10n.language),
            subtitle: Text(l10n.languageDescription),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {
              final actions = L10n.supportedLocales
                  .map(
                    (locale) => CupertinoActionSheetAction(
                      child: Text(
                        locale.languageCode,
                      ),
                      onPressed: () {
                        provider.changeAppLanguage(
                          languageCode: locale.languageCode,
                        );
                        Navigator.pop(context);
                      },
                    ),
                  )
                  .toList();
              showCupertinoModalPopup(
                context: context,
                builder: (context) => CupertinoActionSheet(
                  actions: actions,
                ),
              );
              // settingsProvider.changeLanguage(locale: locale)
            },
          ),
          ListTile(
            leading: const Icon(Icons.login_outlined),
            title: Text(l10n.logoutButton),
            onTap: () {
              viewModel.logout();
              router.replaceNamed('/');
            },
          )
        ],
      ),
    );
  }
}
