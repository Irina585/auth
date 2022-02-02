// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userID.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserID _$UserIDFromJson(Map<String, dynamic> json) => UserID(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      completed: json['completed'] as bool,
    );

Map<String, dynamic> _$UserIDToJson(UserID instance) => <String, dynamic>{
      'userId': instance.userId,
      'id': instance.id,
      'title': instance.title,
      'completed': instance.completed,
    };
