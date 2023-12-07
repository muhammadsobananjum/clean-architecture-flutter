// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) {
  return _UserEntity.fromJson(json);
}

/// @nodoc
mixin _$UserEntity {
  @JsonKey(name: r'$id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: r'Id')
  int get dataId => throw _privateConstructorUsedError;
  String get Name => throw _privateConstructorUsedError;
  String get Email => throw _privateConstructorUsedError;
  String get Token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserEntityCopyWith<UserEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEntityCopyWith<$Res> {
  factory $UserEntityCopyWith(
          UserEntity value, $Res Function(UserEntity) then) =
      _$UserEntityCopyWithImpl<$Res, UserEntity>;
  @useResult
  $Res call(
      {@JsonKey(name: r'$id') String id,
      @JsonKey(name: r'Id') int dataId,
      String Name,
      String Email,
      String Token});
}

/// @nodoc
class _$UserEntityCopyWithImpl<$Res, $Val extends UserEntity>
    implements $UserEntityCopyWith<$Res> {
  _$UserEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dataId = null,
    Object? Name = null,
    Object? Email = null,
    Object? Token = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      dataId: null == dataId
          ? _value.dataId
          : dataId // ignore: cast_nullable_to_non_nullable
              as int,
      Name: null == Name
          ? _value.Name
          : Name // ignore: cast_nullable_to_non_nullable
              as String,
      Email: null == Email
          ? _value.Email
          : Email // ignore: cast_nullable_to_non_nullable
              as String,
      Token: null == Token
          ? _value.Token
          : Token // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserEntityImplCopyWith<$Res>
    implements $UserEntityCopyWith<$Res> {
  factory _$$UserEntityImplCopyWith(
          _$UserEntityImpl value, $Res Function(_$UserEntityImpl) then) =
      __$$UserEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: r'$id') String id,
      @JsonKey(name: r'Id') int dataId,
      String Name,
      String Email,
      String Token});
}

/// @nodoc
class __$$UserEntityImplCopyWithImpl<$Res>
    extends _$UserEntityCopyWithImpl<$Res, _$UserEntityImpl>
    implements _$$UserEntityImplCopyWith<$Res> {
  __$$UserEntityImplCopyWithImpl(
      _$UserEntityImpl _value, $Res Function(_$UserEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? dataId = null,
    Object? Name = null,
    Object? Email = null,
    Object? Token = null,
  }) {
    return _then(_$UserEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      dataId: null == dataId
          ? _value.dataId
          : dataId // ignore: cast_nullable_to_non_nullable
              as int,
      Name: null == Name
          ? _value.Name
          : Name // ignore: cast_nullable_to_non_nullable
              as String,
      Email: null == Email
          ? _value.Email
          : Email // ignore: cast_nullable_to_non_nullable
              as String,
      Token: null == Token
          ? _value.Token
          : Token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserEntityImpl implements _UserEntity {
  const _$UserEntityImpl(
      {@JsonKey(name: r'$id') this.id = '',
      @JsonKey(name: r'Id') this.dataId = 0,
      this.Name = '',
      this.Email = '',
      this.Token = ''});

  factory _$UserEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserEntityImplFromJson(json);

  @override
  @JsonKey(name: r'$id')
  final String id;
  @override
  @JsonKey(name: r'Id')
  final int dataId;
  @override
  @JsonKey()
  final String Name;
  @override
  @JsonKey()
  final String Email;
  @override
  @JsonKey()
  final String Token;

  @override
  String toString() {
    return 'UserEntity(id: $id, dataId: $dataId, Name: $Name, Email: $Email, Token: $Token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.dataId, dataId) || other.dataId == dataId) &&
            (identical(other.Name, Name) || other.Name == Name) &&
            (identical(other.Email, Email) || other.Email == Email) &&
            (identical(other.Token, Token) || other.Token == Token));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, dataId, Name, Email, Token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserEntityImplCopyWith<_$UserEntityImpl> get copyWith =>
      __$$UserEntityImplCopyWithImpl<_$UserEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserEntityImplToJson(
      this,
    );
  }
}

abstract class _UserEntity implements UserEntity {
  const factory _UserEntity(
      {@JsonKey(name: r'$id') final String id,
      @JsonKey(name: r'Id') final int dataId,
      final String Name,
      final String Email,
      final String Token}) = _$UserEntityImpl;

  factory _UserEntity.fromJson(Map<String, dynamic> json) =
      _$UserEntityImpl.fromJson;

  @override
  @JsonKey(name: r'$id')
  String get id;
  @override
  @JsonKey(name: r'Id')
  int get dataId;
  @override
  String get Name;
  @override
  String get Email;
  @override
  String get Token;
  @override
  @JsonKey(ignore: true)
  _$$UserEntityImplCopyWith<_$UserEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
