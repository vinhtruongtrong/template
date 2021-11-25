/*
 * @Author: vinhtruongtrong 
 * @Date: 2021-11-22 11:46:55 
 * @Last Modified by: vinhtruongtrong
 * @Last Modified time: 2021-11-22 13:06:21
 */

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageHelper {
  static final _singleton = LocalStorageHelper._internal();
  static Future<SharedPreferences> preferences =
      SharedPreferences.getInstance();
  final secureStorage = const FlutterSecureStorage();

  factory LocalStorageHelper() {
    return _singleton;
  }
  LocalStorageHelper._internal();

  static LocalStorageHelper get instance => LocalStorageHelper();
}
