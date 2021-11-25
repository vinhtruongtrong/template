import 'package:json_annotation/json_annotation.dart';

part 'user_agent.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UserAgent {
  UserAgent({
    this.deviceName = '',
    this.deviceVersion = '',
    this.deviceModel = '',
    this.identifier = '',
    this.appName = '',
    this.packageName = '',
    this.version = '',
    this.buildNumber = '',
    this.language = '',
    this.platform = '',
  });
  String deviceName;
  String deviceVersion;
  String deviceModel;
  String identifier;
  String appName;
  String packageName;
  String version;
  String buildNumber;
  String language;
  String platform;

  factory UserAgent.fromJson(Map<String, dynamic> json) =>
      _$UserAgentFromJson(json);
  Map<String, dynamic> toJson() => _$UserAgentToJson(this);
}
