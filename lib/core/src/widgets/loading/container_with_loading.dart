import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'loading.dart';
import 'loading_state_viewmodel.dart';

class ContainerWithLoading extends ConsumerWidget {
  const ContainerWithLoading({
    Key? key,
    required this.child,
    this.loading,
    this.loadingState,
  }) : super(key: key);

  final Widget child;
  final Widget? loading;
  final AutoDisposeChangeNotifierProvider<LoadingStateViewModel>? loadingState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading =
        loadingState != null ? ref.watch(loadingState!).isLoading : false;
    return Stack(
      children: [
        child,
        if (isLoading) loading ?? const Loading(),
      ],
    );
  }
}
