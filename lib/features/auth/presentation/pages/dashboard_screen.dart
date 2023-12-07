import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/app_route.dart';
import '../../../../core/services/hive/hive.dart';
import '../../../../core/util/constants.dart';
import '../../../../core/util/ext/string.dart';

import '../cubit/auth_cubit.dart';
import '../cubit/auth_state_cubit.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthCubitState>(
      listener: (ctx,state){
        if (state.authCubitStatus.isError) {
          SERVER_FAILURE.toToastError(context);
        }else if (state.authCubitStatus.isSuccess) {
          context.go(Routes.login.path);
        }

      },
      child: Scaffold(
        appBar: AppBar(title: const Text(AppConstants.dashboard), backgroundColor: kPrimaryColor,),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome ${MainBoxMixin.mainBox?.get(MainBoxKeys.email.name) as String}'),
              const SizedBox(height: 40,),
              InkWell(
                radius: 200,
                borderRadius: BorderRadius.circular(200),
                onTap: () async{
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text(AppConstants.logout),
                        content: const Text(AppConstants.are_you_sure_to_logout),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(AppConstants.cancel),
                          ),
                          TextButton(
                            onPressed: () {
                              context.read<AuthCubit>().logout();
                              Navigator.of(context).pop();

                            },
                            child: const Text(AppConstants.logout),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Icon(Icons.power_settings_new, size: 100, color: Colors.red,),
              ),
              const SizedBox(height: 40,),
            ],
          ),
        ),
      ),
    );
  }
}
