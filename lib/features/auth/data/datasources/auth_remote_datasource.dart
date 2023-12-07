
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/network/api/dio_client.dart';
import '../../../../core/network/api/list_api.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/login_usecase.dart';
import '../models/auth_response_model.dart';

abstract class AuthRemoteDataSource {
  Future <Either<Failure, UserEntity>> login(LoginParams loginParams);
}


@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDatasourceImpl implements AuthRemoteDataSource {

  final DioClient _client;

  AuthRemoteDatasourceImpl(this._client);

  @override
  Future<Either<Failure, UserEntity>> login(LoginParams loginParams) async {
    final response = await _client.postRequest(
      ListAPI.login,
      data: loginParams.toJson(),
      converter: (response) {
        return  AuthResponseModel.fromJson(response).data;
      },
    );
    return response;
  }

}