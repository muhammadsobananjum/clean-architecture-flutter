// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/network/api/dio_client.dart' as _i4;
import 'core/services/hive/main_box.dart' as _i5;
import 'features/auth/data/datasources/auth_remote_datasource.dart' as _i6;
import 'features/auth/data/repositories/auth_repository_impl.dart' as _i8;
import 'features/auth/domain/repositories/auth_repository.dart' as _i7;
import 'features/auth/domain/usecases/login_usecase.dart' as _i9;
import 'features/auth/presentation/bloc/auth_bloc.dart' as _i10;
import 'features/auth/presentation/cubit/auth_cubit.dart' as _i3;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.AuthCubit>(() => _i3.AuthCubit());
  gh.singleton<_i4.DioClient>(_i4.DioClient());
  gh.singleton<_i5.MainBoxMixin>(_i5.MainBoxMixin());
  gh.lazySingleton<_i6.AuthRemoteDataSource>(
      () => _i6.AuthRemoteDatasourceImpl(gh<_i4.DioClient>()));
  gh.lazySingleton<_i7.AuthRepository>(() => _i8.AuthRepositoryImpl(
        gh<_i6.AuthRemoteDataSource>(),
        gh<_i5.MainBoxMixin>(),
      ));
  gh.lazySingleton<_i9.LoginUseCase>(
      () => _i9.LoginUseCase(gh<_i7.AuthRepository>()));
  gh.factory<_i10.AuthBloc>(() => _i10.AuthBloc(gh<_i9.LoginUseCase>()));
  return getIt;
}
