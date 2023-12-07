import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/services/hive/main_box.dart';
import 'auth_state_cubit.dart';

@injectable
class AuthCubit extends Cubit<AuthCubitState>  {
  AuthCubit(): super(const AuthCubitState());

  Future<void> logout() async {
    try{
      emit(state.copyWith(authCubitStatus: AuthCubitStatus.loading));
      await MainBoxMixin().logoutBox();
      emit(state.copyWith(authCubitStatus: AuthCubitStatus.success));
    }catch(ex) {
      emit(state.copyWith(authCubitStatus: AuthCubitStatus.error));
    }
  }

}