import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template/core/src/widgets/loading/loading_state_viewmodel.dart';

AutoDisposeChangeNotifierProvider<LoadingStateViewModel> useLoadingState() {
  return useMemoized(() => LoadingStateViewModel().provider);
}
