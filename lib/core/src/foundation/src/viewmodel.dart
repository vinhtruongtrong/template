/*
 * @Author: vinhtruongtrong 
 * @Date: 2021-11-24 10:44:59 
 * @Last Modified by:   vinhtruongtrong 
 * @Last Modified time: 2021-11-24 10:44:59 
 */
import 'package:flutter/material.dart';
import 'package:template/core/src/mixin/safe_notify_listeners.dart';

abstract class BaseViewModel extends ChangeNotifier with SafeNotifyListeners {}
