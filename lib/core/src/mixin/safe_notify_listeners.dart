/*
 * @Author: vinhtruongtrong 
 * @Date: 2021-11-24 09:22:35 
 * @Last Modified by: vinhtruongtrong
 * @Last Modified time: 2021-11-24 09:25:52
 */
import 'package:flutter/foundation.dart';

mixin SafeNotifyListeners on ChangeNotifier {
  bool _disposed = false;

  @mustCallSuper
  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @mustCallSuper
  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }
}
