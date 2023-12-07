import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


import '../../features/auth/presentation/pages/dashboard_screen.dart';
import '../../features/auth/presentation/pages/login_screen.dart';
import '../../features/auth/presentation/pages/splash_screen.dart';
import '../services/hive/main_box.dart';



enum Routes {
  root('/'),
  splashScreen('/splashscreen'),

  /// Home Page
  dashboard('/dashboard'),

  // Auth Page
  login('/auth/login'),
  ;

  const Routes(this.path);

  final String path;
}

class AppRoute {
  static late BuildContext context;

  AppRoute.setStream(BuildContext ctx) {
    context = ctx;
  }

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: Routes.splashScreen.path,
        name: Routes.splashScreen.name,
        builder: (_, __) => const SplashScreen(),
      ),
      GoRoute(
        path: Routes.dashboard.path,
        name: Routes.dashboard.name,
        builder:(_, __) => const DashBoardScreen(),
        redirect: (_, __) => Routes.dashboard.path,
      ),
      GoRoute(
        path: Routes.login.path,
        name: Routes.login.name,
        builder: (_, __) => const LoginScreen(),
      ),

    ],
    initialLocation: Routes.splashScreen.path,
    routerNeglect: true,
    debugLogDiagnostics: kDebugMode,
    redirect: (_, GoRouterState state) {
      final bool isLoginPage = state.matchedLocation == Routes.login.path;






      ///  Check if not login
      ///  if current page is login page we don't need to direct user
      ///  but if not we must direct user to login page
      if (!((MainBoxMixin.mainBox?.get(MainBoxKeys.isLogin.name) as bool?) ??
          false)) {
        return isLoginPage ? null : Routes.login.path;
      }

      /// Check if already login and in login page
      /// we should direct user to main page

      if (isLoginPage &&
          ((MainBoxMixin.mainBox?.get(MainBoxKeys.isLogin.name) as bool?) ??
              false)) {
        return Routes.dashboard.path;
      }

      /// No direct
      return null;
    },
  );
}
