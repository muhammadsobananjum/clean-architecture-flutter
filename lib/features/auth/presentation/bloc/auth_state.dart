import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/user_entity.dart';

part 'auth_state.freezed.dart';


enum AuthStatus { initial, success, error, loading , authError}

extension AuthStatusX on AuthStatus {
  bool get isInitial => this == AuthStatus.initial;
  bool get isSuccess => this == AuthStatus.success;
  bool get isError => this == AuthStatus.error;
  bool get isAuthError => this == AuthStatus.authError;
  bool get isLoading => this == AuthStatus.loading;
}


@freezed
abstract class AuthState with _$AuthState {
   const factory AuthState({
     @Default(UserEntity()) UserEntity userEntity,
     @Default(AuthStatus.initial) AuthStatus authStatus,
}) = _AuthState;
}



