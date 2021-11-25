import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
  Post({
    this.userId = 0,
    this.id = 0,
    this.title = '',
    this.body = '',
  });

  int userId;
  int id;
  String title;
  String body;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}
