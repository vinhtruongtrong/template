import 'package:json_annotation/json_annotation.dart';

part 'comment.g.dart';

@JsonSerializable()
class Comment {
  Comment({
    this.postId = 0,
    this.id = 0,
    this.name = '',
    this.email = '',
    this.body = '',
  });

  int postId;
  int id;
  String name;
  String email;
  String body;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
