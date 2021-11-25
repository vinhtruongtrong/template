import 'package:json_annotation/json_annotation.dart';

part 'params.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class LoginParam {
  String useName;
  String password;
  LoginParam({
    this.useName = '',
    this.password = '',
  });
  factory LoginParam.fromJson(Map<String, dynamic> data) =>
      _$LoginParamFromJson(data);

  Map<String, dynamic> toJson() => _$LoginParamToJson(this);
}
