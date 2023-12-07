import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state_cubit.freezed.dart';

enum AuthCubitStatus { success, error, loading, initial }

extension AuthStatusX on AuthCubitStatus {
  bool get isInitial => this == AuthCubitStatus.initial;
  bool get isSuccess => this == AuthCubitStatus.success;
  bool get isError => this == AuthCubitStatus.error;
  bool get isLoading => this == AuthCubitStatus.loading;
}


@freezed
abstract class AuthCubitState with _$AuthCubitState {
  const factory AuthCubitState({
    @Default(AuthCubitStatus.initial) AuthCubitStatus authCubitStatus,
  }) = _AuthCubitState;
}