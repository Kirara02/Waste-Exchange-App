import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:waste_exchange/presentation/misc/app_routes.dart';
import 'package:waste_exchange/presentation/pages/login/login_page.dart';
import 'package:waste_exchange/presentation/pages/main/main_page.dart';
import 'package:waste_exchange/presentation/pages/register/register_page.dart';
import 'package:waste_exchange/presentation/pages/splash/splash_page.dart';

part 'router_provider.g.dart';

@Riverpod(keepAlive: true)
Raw<GoRouter> router(RouterRef ref) => GoRouter(
      routes: [
        GoRoute(
          path: Routes.SPLASH,
          name: "splash",
          builder: (context, state) {
            return const SplashPage();
          },
        ),
        GoRoute(
          path: Routes.LOGIN,
          name: "login",
          builder: (context, state) {
            return const LoginPage();
          },
        ),
        GoRoute(
          path: Routes.REGISTER,
          name: "register",
          builder: (context, state) {
            return const RegisterPage();
          },
        ),
        GoRoute(
          path: Routes.MAIN,
          name: "main",
          builder: (context, state) {
            return const MainPage();
          },
        ),
      ],
      initialLocation: Routes.SPLASH,
      debugLogDiagnostics: false,
    );
