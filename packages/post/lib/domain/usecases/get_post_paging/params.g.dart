// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPostsPagingParam _$GetPostsPagingParamFromJson(Map<String, dynamic> json) =>
    GetPostsPagingParam(
      pageSize: json['pageSize'] as int? ?? 0,
      pageIndex: json['pageIndex'] as int? ?? 0,
    );

Map<String, dynamic> _$GetPostsPagingParamToJson(
        GetPostsPagingParam instance) =>
    <String, dynamic>{
      'pageSize': instance.pageSize,
      'pageIndex': instance.pageIndex,
    };
