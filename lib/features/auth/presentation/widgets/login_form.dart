import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/app_button.dart';
import '../../../../core/util/constants.dart';
import '../../../../core/util/ext/string.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    /// Global key
    final keyForm = GlobalKey<FormState>();

    /// Controller
    final conEmail = TextEditingController();
    final conPassword = TextEditingController();

    /// Focus Node
    final fnEmail = FocusNode();
    final fnPassword = FocusNode();

    return Form(
      key: keyForm,
      child: Column(
        children: [
          TextFormField(
            controller: conEmail,
            focusNode: fnEmail,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            validator: (String? value) => value != null
                ? (!value.isValidEmail()
                    ? AppConstants.invalid_email_address
                    : null)
                : null,
            decoration: const InputDecoration(
              hintText: AppConstants.hint_email,
              border: OutlineInputBorder(),
              prefixIcon: Padding(
                padding: EdgeInsets.all(defaultPadding),
                child: Icon(Icons.alternate_email),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              controller: conPassword,
              focusNode: fnPassword,
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              validator: (String? value) => value != null
                  ? (value.length < 6
                      ? AppConstants.password_length_greater_than_6
                      : null)
                  : null,
              decoration: const InputDecoration(
                hintText: AppConstants.hint_password,
                border: OutlineInputBorder(),
                prefixIcon: Padding(
                  padding: EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock_outline),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state.authStatus.isInitial) {
                return AppButton(
                  text: AppConstants.login.toUpperCase(),
                  color: kPrimaryColor,
                  onTap: () {
                    if (keyForm.currentState?.validate() ?? false) {
                      context.read<AuthBloc>().add(
                            LoginEvent(
                              email: conEmail.text,
                              password: conPassword.text.toInt(),
                            ),
                          );
                    }
                  },
                );
              } else if (state.authStatus.isLoading) {
                return const CircularProgressIndicator();
              } else {
                return AppButton(
                  text: AppConstants.login.toUpperCase(),
                  color: kPrimaryColor,
                  onTap: () {
                    if (keyForm.currentState?.validate() ?? false) {
                      context.read<AuthBloc>().add(
                            LoginEvent(
                              email: conEmail.text,
                              password: conPassword.text.toInt(),
                            ),
                          );
                    }
                  },
                );
              }
            },
          ),
          const SizedBox(height: defaultPadding),
        ],
      ),
    );
  }
}
