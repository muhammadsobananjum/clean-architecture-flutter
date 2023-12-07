
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';


@freezed
abstract class UserEntity with _$UserEntity {
    const factory UserEntity({
        @JsonKey(name: r'$id')
        @Default('') String id,
        @JsonKey(name: r'Id')
        @Default(0) int dataId,
        @Default('') String Name,
        @Default('') String Email,
        @Default('') String Token,
    }) = _UserEntity;

    factory UserEntity.fromJson(Map<String, dynamic> json) => _$UserEntityFromJson(json);
}