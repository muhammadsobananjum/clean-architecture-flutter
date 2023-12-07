import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/components/responsive.dart';
import '../../../../core/routing/app_route.dart';
import '../../../../core/util/constants.dart';
import '../../../../core/util/ext/string.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_state.dart';
import '../widgets/background.dart';
import '../widgets/login_form.dart';
import '../widgets/login_screen_top_image.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (__, state) {
        if (state.authStatus.isError) {
          SERVER_FAILURE.toToastError(context);
        } else if (state.authStatus.isAuthError) {
          AUTH_FAILURE.toToastWarning(context);
        } else if (state.authStatus.isSuccess) {
          context.go(Routes.dashboard.path);
        }
      },
      child: const Background(
        child: SingleChildScrollView(
          child: Responsive(
            mobile: MobileLoginScreen(),
            desktop: Row(
              children: [
                Expanded(
                  child: LoginScreenTopImage(),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 450,
                        child: LoginForm(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MobileLoginScreen extends StatelessWidget {
  const MobileLoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: <Widget>[
          LoginScreenTopImage(),
          Row(
            children: [
              Spacer(),
              Expanded(
                flex: 6,
                child: LoginForm(),
              ),
              Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
