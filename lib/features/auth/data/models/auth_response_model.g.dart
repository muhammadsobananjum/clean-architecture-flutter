// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthResponseModelImpl _$$AuthResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthResponseModelImpl(
      id: json['id'] as String? ?? '',
      code: json['code'] as int,
      message: json['message'] as String,
      data: json['data'] == null
          ? const UserEntity()
          : UserEntity.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AuthResponseModelImplToJson(
        _$AuthResponseModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'message': instance.message,
      'data': instance.data,
    };
