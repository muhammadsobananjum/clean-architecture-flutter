
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/user_entity.dart';

part 'auth_response_model.freezed.dart';
part 'auth_response_model.g.dart';



@freezed
abstract class AuthResponseModel with _$AuthResponseModel {
  const factory AuthResponseModel({

    @Default('') String id,
    required int code,
    required String message,
    @JsonKey(includeIfNull: false)
    @Default(UserEntity()) UserEntity data ,
  }) = _AuthResponseModel;

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) => _$AuthResponseModelFromJson(json);



}

