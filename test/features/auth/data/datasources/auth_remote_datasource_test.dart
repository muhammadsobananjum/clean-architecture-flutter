import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:lifebonder/core/network/api/api.dart';
import 'package:lifebonder/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:lifebonder/features/auth/data/models/auth_response_model.dart';
import 'package:lifebonder/features/auth/domain/usecases/login_usecase.dart';
import 'package:lifebonder/injection.dart';

import '../../../../mocks/reader.dart';
import '../../../../mocks/util/paths.dart';

void main (){

  late AuthRemoteDatasourceImpl dataSource;
  late DioAdapter dioAdapter;


  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    dataSource = AuthRemoteDatasourceImpl(getIt<DioClient>());
  });



  group('login', ()  {
    const loginParams =
    LoginParams(email: 'test@gmail.com, password: "123456');

    final Map<String, dynamic> jsonMap = json.decode(reader('success_response.json'));
    dioAdapter = DioAdapter(dio: getIt<DioClient>().dio);
    final response = AuthResponseModel.fromJson(jsonMap);

    final loginModel = response.data;

    test(
      'should return login success model when response code is 200',
          () async {
        /// arrange
        dioAdapter.onPost(
          ListAPI.login,
              (server) => server.reply(
            200,
            json.decode(reader(successLoginPath)),
          ),
          data: loginParams.toJson(),
        );

        /// act
        final result = await dataSource.login(loginParams);

        /// assert
        result.fold(
              (l) => expect(l, null),
              (r) => expect(r, loginModel),
        );
      },
    );

  });

}