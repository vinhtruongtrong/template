import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template/core/src/foundation/foundation.dart';

final loadingStateProvider = LoadingStateViewModel().provider;

class LoadingStateViewModel extends BaseViewModel {
  bool isLoading = false;

  Future<dynamic> whileLoading(Future Function() future) {
    return Future.microtask(toLoading)
        .then((_) => future())
        .whenComplete(toIdle);
  }

  void toLoading() {
    if (isLoading) return;
    isLoading = true;
    notifyListeners();
  }

  void toIdle() {
    if (!isLoading) return;
    isLoading = false;
    notifyListeners();
  }
}

extension LoadingStateViewModelX on LoadingStateViewModel {
  AutoDisposeChangeNotifierProvider<LoadingStateViewModel> get provider =>
      ChangeNotifierProvider.autoDispose((ref) => this);
}
