


import 'l10n.dart';

/// The translations for English (`en`).
class L10nEn extends L10n {
  L10nEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Ree<Pay';

  @override
  String greetingMessage(Object user) {
    return 'Hello $user';
  }

  @override
  String get loginButton => 'Login';

  @override
  String get forgotPasswordButton => 'Forgot password';

  @override
  String get logoutButton => 'Logout';

  @override
  String get language => 'Language';

  @override
  String get languageDescription => 'You can change language';

  @override
  String get darkMode => 'Dark mode';

  @override
  String get darkModeDescription => 'You can change theme mode';
}
