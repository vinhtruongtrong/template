import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';
import 'package:package_info/package_info.dart';
import 'dart:developer' as developer;
import 'model/user_agent.dart';

class UserAgentHelper {
  static UserAgent? _userAgent;
  static Future<UserAgent> load() async {
    if (_userAgent == null) {
      final packageInfo = await PackageInfo.fromPlatform();
      final deviceInfoPlugin = DeviceInfoPlugin();

      final userAgent = UserAgent()
        ..platform = Platform.operatingSystem
        ..appName = packageInfo.appName
        ..packageName = packageInfo.packageName
        ..version = packageInfo.version
        ..buildNumber = packageInfo.buildNumber;

      try {
        if (Platform.isAndroid) {
          var build = await deviceInfoPlugin.androidInfo;
          userAgent
            ..deviceName = build.brand
            ..deviceVersion = build.version.toString()
            ..deviceModel = build.model
            ..identifier = build.androidId;
        } else if (Platform.isIOS) {
          var data = await deviceInfoPlugin.iosInfo;
          userAgent
            ..deviceName = data.name
            ..deviceVersion = data.systemVersion
            ..deviceModel = data.model
            ..identifier = data.identifierForVendor;
        }
      } on PlatformException {
        developer.log(
          'Failed to get platform version',
          name: (UserAgentHelper).toString(),
        );
      }
      _userAgent = userAgent;
    }
    return _userAgent!;
  }
}
