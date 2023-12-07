import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../error/failure.dart';
import 'dio_interceptor.dart';
import 'isolate_parser.dart';

typedef ResponseConverter<T> = T Function(dynamic response);



@singleton
class DioClient {

  final String baseUrl = 'http://restapi.adequateshop.com/api/authaccount/';
  String? _auth;
  bool _isUnitTest = true;
  late Dio _dio;

  DioClient() {
    _isUnitTest = true;

    _dio = _createDio();

    if (!_isUnitTest) _dio.interceptors.add(DioInterceptor());
  }

  Dio get dio {
    if (_isUnitTest) {
      return _dio;
    } else {
      final dio = _createDio();
      if (!_isUnitTest) dio.interceptors.add(DioInterceptor());
      return dio;
    }
  }

  Dio _createDio() => Dio(
    BaseOptions(
      baseUrl: baseUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        if (_auth != null) ...{
          'Authorization': _auth,
        },
      },
      receiveTimeout: const Duration(minutes: 1),
      connectTimeout: const Duration(minutes: 1),
      validateStatus: (int? status) {
        return status! > 0;
      },
    ),
  );

  Future<Either<Failure, T>> getRequest<T>(
      String url, {
        Map<String, dynamic>? queryParameters,
        required ResponseConverter<T> converter,
        bool isIsolate = true,
      }) async {
    try {
      final response = await dio.get(url, queryParameters: queryParameters);
      if ((response.statusCode ?? 0) < 200 ||
          (response.statusCode ?? 0) > 201) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }

      if (!isIsolate) {
        return Right(converter(response.data));
      }
      final isolateParse = IsolateParser<T>(
        response.data as Map<String, dynamic>,
        converter,
      );
      final result = await isolateParse.parseInBackground();
      return Right(result);
    } on DioException catch (e) {

      return Left(
        ServerFailure(
          e.response?.data['error'] ?? e.message,
        ),
      );
    }
  }

  Future<Either<Failure, T>> postRequest<T>(
      String url, {
        Map<String, dynamic>? data,
        required ResponseConverter<T> converter,
        bool isIsolate = false,
      }) async {
    try {
      final response = await dio.post(url, data: data);
      if ((response.statusCode ?? 0) < 200 ||
          (response.statusCode ?? 0) > 201) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }

      if (!isIsolate) {
        return Right(converter(response.data));
      }
      final isolateParse = IsolateParser<T>(
        response.data as Map<String, dynamic>,
        converter,
      );
      final result = await isolateParse.parseInBackground();
      return Right(result);
    } on DioException catch (e) {
      return Left(
        ServerFailure(
          e.response?.data['error'] ?? e.message,
        ),
      );
    }
  }
}
