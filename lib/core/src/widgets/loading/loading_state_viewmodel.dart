import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loadingStateProvider = LoadingStateViewModel().provider;

class LoadingStateViewModel extends ChangeNotifier {
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
  ChangeNotifierProvider<LoadingStateViewModel> get provider =>
      ChangeNotifierProvider((ref) => this);
}
