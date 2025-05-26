import 'package:go_router/go_router.dart';
import 'package:modelo_mvvm/core/splash_page.dart';
import 'package:modelo_mvvm/modules/auth/view/login_page.dart';
import 'package:modelo_mvvm/modules/home/view/home.dart';
import 'package:modelo_mvvm/routes/routes.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: Routes.splash,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: Routes.home,
      builder: (context, state) => const MyHomePage(title: 'Projeto MVVM'),
    ),
    GoRoute(path: Routes.login, builder: (context, state) => const LoginPage()),
  ],
);
