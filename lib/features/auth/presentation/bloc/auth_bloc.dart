import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/login_usecase.dart';

import 'auth_event.dart';
import 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase uLogin;

  AuthBloc(this.uLogin) : super(const AuthState()) {
    on<LoginEvent>(_onLoginEvent);
  }

  Future<void> _onLoginEvent(LoginEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(authStatus: AuthStatus.loading));
    try {
      final response = await uLogin.repository
          .login(LoginParams(email: event.email, password: event.password));
      response.fold((error) {
        emit(
          state.copyWith(
            authStatus: AuthStatus.error,
          ),
        );
      }, (user) {
        if (user.id == '' && user.Email == '') {
          emit(state.copyWith(authStatus: AuthStatus.authError));
        } else {
          emit(state.copyWith(authStatus: AuthStatus.success, userEntity: user),);
        }
      });
    } catch (exception) {
      emit(state.copyWith(authStatus: AuthStatus.error));
    }
  }
}
