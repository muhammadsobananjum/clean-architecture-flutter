// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserEntityImpl _$$UserEntityImplFromJson(Map<String, dynamic> json) =>
    _$UserEntityImpl(
      id: json[r'$id'] as String? ?? '',
      dataId: json['Id'] as int? ?? 0,
      Name: json['Name'] as String? ?? '',
      Email: json['Email'] as String? ?? '',
      Token: json['Token'] as String? ?? '',
    );

Map<String, dynamic> _$$UserEntityImplToJson(_$UserEntityImpl instance) =>
    <String, dynamic>{
      r'$id': instance.id,
      'Id': instance.dataId,
      'Name': instance.Name,
      'Email': instance.Email,
      'Token': instance.Token,
    };
