import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/user_entity.dart';
import '../usecases/login_usecase.dart';


abstract class AuthRepository {
  Future <Either<Failure, UserEntity>> login(LoginParams loginParams);

}
