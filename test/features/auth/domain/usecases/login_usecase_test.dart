import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:lifebonder/core/error/failure.dart';
import 'package:lifebonder/core/util/constants.dart';
import 'package:lifebonder/features/auth/data/models/auth_response_model.dart';
import 'package:lifebonder/features/auth/domain/entities/user_entity.dart';
import 'package:lifebonder/features/auth/domain/usecases/login_usecase.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../mocks/reader.dart';
import '../../../../mocks/util/gen_mocks.mocks.dart';

void main() {
  late MockAuthRepository mockAuthRepository;
  late LoginUseCase useCase;

  late UserEntity authResponse;

  const loginCred = LoginParams(email: 'test@gmail.com', password: 1234);

  setUp(() async {
    mockAuthRepository = MockAuthRepository();
    useCase = LoginUseCase(mockAuthRepository);
    final Map<String, dynamic> jsonMap =
        await json.decode(reader('success_response.json'));
    final response = AuthResponseModel.fromJson(jsonMap);
    authResponse = response.data;
  });

  test(
    'should verify login success',
    () async {
      // arrange
      when(mockAuthRepository.login(loginCred))
          .thenAnswer((_) async => Right(authResponse));
      // act
      final result = await useCase.call(loginCred);
      // assert
      expect(result, equals(Right(authResponse)));
    },
  );

  test(
    'should verify login failure with wrong credentials',
    () async {
      // arrange
      when(mockAuthRepository.login(loginCred))
          .thenAnswer((_) async => Left(ServerFailure(SERVER_FAILURE)));
      // act
      final result = await useCase.call(loginCred);
      // assert
      expect(result, equals(Left(ServerFailure(SERVER_FAILURE))));
    },
  );
}
