import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template/core/src/foundation/foundation.dart';

final settingsViewModelProvider =
    ChangeNotifierProvider.autoDispose<SettingsViewModel>((ref) {
  return SettingsViewModel();
});

class SettingsViewModel extends BaseViewModel {
  void logout() {}
}
