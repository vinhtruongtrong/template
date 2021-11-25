/*
 * @Author: vinhtruongtrong 
 * @Date: 2021-11-04 21:19:43 
 * @Last Modified by: vinhtruongtrong
 * @Last Modified time: 2021-11-23 09:42:29
 */
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'network_aware.dart';
import 'state_provider.dart';

class NetworkObserver extends StatefulWidget {
  final Widget child;
  const NetworkObserver({Key? key, required this.child}) : super(key: key);

  @override
  _NetworkObserverState createState() => _NetworkObserverState();
}

class _NetworkObserverState extends State<NetworkObserver>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) {
        final isOffline = ref.watch(networkAwareProvider) == NetworkStatus.off;
        final view = Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(child: widget.child),
            DefaultNetworkAware(
              isOffline: isOffline,
              controller: _controller,
            )
          ],
        );
        return view;
      },
    );
  }
}
