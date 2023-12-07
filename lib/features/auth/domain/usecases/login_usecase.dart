import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/user_entity.dart';
import '../repositories/auth_repository.dart';

part 'login_usecase.freezed.dart';
part 'login_usecase.g.dart';

@lazySingleton
class LoginUseCase extends UseCase<UserEntity, LoginParams> {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(LoginParams params) => repository.login(params);
  
}

@freezed
class LoginParams with _$LoginParams {
  const factory LoginParams({
    @Default('') String email,
    @Default(0) int password,
  }) = _LoginParams;

  factory LoginParams.fromJson(Map<String, dynamic> json) =>
      _$LoginParamsFromJson(json);
}
