import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/services/hive/main_box.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/usecases/login_usecase.dart';
import '../datasources/auth_remote_datasource.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository{


  final AuthRemoteDataSource authRemoteDatasource;
  final MainBoxMixin mainBoxMixin;


  AuthRepositoryImpl(this.authRemoteDatasource, this.mainBoxMixin);

  @override
  Future<Either<Failure, UserEntity>> login(LoginParams loginParams) async {
    final response = await authRemoteDatasource.login(loginParams);
    return response.fold(
          (failure) => Left(failure),
          (loginResponse) {
            mainBoxMixin.addData(MainBoxKeys.isLogin, true);
            mainBoxMixin.addData(MainBoxKeys.email, loginResponse.Email);
        return Right(loginResponse);
      },
    );
  }

}