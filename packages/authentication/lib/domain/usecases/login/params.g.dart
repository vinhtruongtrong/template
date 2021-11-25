// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginParam _$LoginParamFromJson(Map<String, dynamic> json) => LoginParam(
      useName: json['use_name'] as String? ?? '',
      password: json['password'] as String? ?? '',
    );

Map<String, dynamic> _$LoginParamToJson(LoginParam instance) =>
    <String, dynamic>{
      'use_name': instance.useName,
      'password': instance.password,
    };
