


import 'l10n.dart';

/// The translations for Vietnamese (`vi`).
class L10nVi extends L10n {
  L10nVi([String locale = 'vi']) : super(locale);

  @override
  String get appTitle => 'Ree<Pay';

  @override
  String greetingMessage(Object user) {
    return 'Xin chào $user';
  }

  @override
  String get loginButton => 'Đăng nhập';

  @override
  String get forgotPasswordButton => 'Quên mật khẩu';

  @override
  String get logoutButton => 'Đăng xuất';

  @override
  String get language => 'Ngôn ngữ';

  @override
  String get languageDescription => 'Bạn có thể thay đổi ngôn ngữ';

  @override
  String get darkMode => 'Giao diện đêm';

  @override
  String get darkModeDescription => 'Bạn có thể thay đổi giao diện đêm';
}
