import 'package:json_annotation/json_annotation.dart';

part 'params.g.dart';

@JsonSerializable()
class GetPostsPagingParam {
  int pageSize;
  int pageIndex;
  GetPostsPagingParam({
    this.pageSize = 0,
    this.pageIndex = 0,
  });

  factory GetPostsPagingParam.fromJson(Map<String, dynamic> json) =>
      _$GetPostsPagingParamFromJson(json);
  Map<String, dynamic> toJson() => _$GetPostsPagingParamToJson(this);
}
