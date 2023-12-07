import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/routing/app_route.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/auth/presentation/cubit/auth_cubit.dart';
import 'injection.dart';

class LifeBonder extends StatelessWidget {
  const LifeBonder({super.key});

  @override
  Widget build(BuildContext context) {

    //AppRoute.setStream(context);


    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<AuthCubit>()),
        BlocProvider(create: (_) => getIt<AuthBloc>()),
      ],
      child: MaterialApp.router(
        routerConfig: AppRoute.router,
        debugShowCheckedModeBanner: false,
        builder: (BuildContext context, Widget? child) {
          final MediaQueryData data = MediaQuery.of(context);

          return MediaQuery(
            data: data.copyWith(
              textScaleFactor: 1,
              alwaysUse24HourFormat: true,
            ),
            child: child!,
          );
        },



      ),
    );
  }
}
