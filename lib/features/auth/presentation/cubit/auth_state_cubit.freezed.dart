// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthCubitState {
  AuthCubitStatus get authCubitStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthCubitStateCopyWith<AuthCubitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthCubitStateCopyWith<$Res> {
  factory $AuthCubitStateCopyWith(
          AuthCubitState value, $Res Function(AuthCubitState) then) =
      _$AuthCubitStateCopyWithImpl<$Res, AuthCubitState>;
  @useResult
  $Res call({AuthCubitStatus authCubitStatus});
}

/// @nodoc
class _$AuthCubitStateCopyWithImpl<$Res, $Val extends AuthCubitState>
    implements $AuthCubitStateCopyWith<$Res> {
  _$AuthCubitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authCubitStatus = null,
  }) {
    return _then(_value.copyWith(
      authCubitStatus: null == authCubitStatus
          ? _value.authCubitStatus
          : authCubitStatus // ignore: cast_nullable_to_non_nullable
              as AuthCubitStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthCubitStateImplCopyWith<$Res>
    implements $AuthCubitStateCopyWith<$Res> {
  factory _$$AuthCubitStateImplCopyWith(_$AuthCubitStateImpl value,
          $Res Function(_$AuthCubitStateImpl) then) =
      __$$AuthCubitStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthCubitStatus authCubitStatus});
}

/// @nodoc
class __$$AuthCubitStateImplCopyWithImpl<$Res>
    extends _$AuthCubitStateCopyWithImpl<$Res, _$AuthCubitStateImpl>
    implements _$$AuthCubitStateImplCopyWith<$Res> {
  __$$AuthCubitStateImplCopyWithImpl(
      _$AuthCubitStateImpl _value, $Res Function(_$AuthCubitStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authCubitStatus = null,
  }) {
    return _then(_$AuthCubitStateImpl(
      authCubitStatus: null == authCubitStatus
          ? _value.authCubitStatus
          : authCubitStatus // ignore: cast_nullable_to_non_nullable
              as AuthCubitStatus,
    ));
  }
}

/// @nodoc

class _$AuthCubitStateImpl implements _AuthCubitState {
  const _$AuthCubitStateImpl({this.authCubitStatus = AuthCubitStatus.initial});

  @override
  @JsonKey()
  final AuthCubitStatus authCubitStatus;

  @override
  String toString() {
    return 'AuthCubitState(authCubitStatus: $authCubitStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthCubitStateImpl &&
            (identical(other.authCubitStatus, authCubitStatus) ||
                other.authCubitStatus == authCubitStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, authCubitStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthCubitStateImplCopyWith<_$AuthCubitStateImpl> get copyWith =>
      __$$AuthCubitStateImplCopyWithImpl<_$AuthCubitStateImpl>(
          this, _$identity);
}

abstract class _AuthCubitState implements AuthCubitState {
  const factory _AuthCubitState({final AuthCubitStatus authCubitStatus}) =
      _$AuthCubitStateImpl;

  @override
  AuthCubitStatus get authCubitStatus;
  @override
  @JsonKey(ignore: true)
  _$$AuthCubitStateImplCopyWith<_$AuthCubitStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
