import 'package:json_annotation/json_annotation.dart';

part 'userID.g.dart';

@JsonSerializable()
class UserID {
  final int userId, id;
  final String title;
  final bool completed;

  UserID({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory UserID.fromJson(Map<String, dynamic> json) => _$UserIDFromJson(json);
  Map<String, dynamic> toJson() => _$UserIDToJson(this);
}


