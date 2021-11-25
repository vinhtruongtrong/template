/*
 * @Author: vinhtruongtrong 
 * @Date: 2021-11-08 11:16:38 
 * @Last Modified by: vinhtruongtrong
 * @Last Modified time: 2021-11-08 11:36:23
 */
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum NetworkStatus { notDetermined, on, off }

class NetworkDetectorNotifier extends StateNotifier<NetworkStatus> {
  final _connectivity = Connectivity();
  NetworkDetectorNotifier() : super(NetworkStatus.notDetermined) {
    _connectivity
        .checkConnectivity()
        .then((value) => state = _toNetworkStatus(value));
    _connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      final newState = _toNetworkStatus(result);
      if (state != newState) {
        state = newState;
      }
    });
  }

  NetworkStatus _toNetworkStatus(ConnectivityResult result) {
    NetworkStatus status;
    switch (result) {
      case ConnectivityResult.mobile:
      case ConnectivityResult.wifi:
        status = NetworkStatus.on;
        break;
      default:
        status = NetworkStatus.off;
        break;
    }
    return status;
  }
}

final networkAwareProvider = StateNotifierProvider((ref) {
  return NetworkDetectorNotifier();
});
