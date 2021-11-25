// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_agent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserAgent _$UserAgentFromJson(Map<String, dynamic> json) => UserAgent(
      deviceName: json['device_name'] as String? ?? '',
      deviceVersion: json['device_version'] as String? ?? '',
      deviceModel: json['device_model'] as String? ?? '',
      identifier: json['identifier'] as String? ?? '',
      appName: json['app_name'] as String? ?? '',
      packageName: json['package_name'] as String? ?? '',
      version: json['version'] as String? ?? '',
      buildNumber: json['build_number'] as String? ?? '',
      language: json['language'] as String? ?? '',
      platform: json['platform'] as String? ?? '',
    );

Map<String, dynamic> _$UserAgentToJson(UserAgent instance) => <String, dynamic>{
      'device_name': instance.deviceName,
      'device_version': instance.deviceVersion,
      'device_model': instance.deviceModel,
      'identifier': instance.identifier,
      'app_name': instance.appName,
      'package_name': instance.packageName,
      'version': instance.version,
      'build_number': instance.buildNumber,
      'language': instance.language,
      'platform': instance.platform,
    };
