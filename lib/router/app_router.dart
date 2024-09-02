import 'package:game_store/core/helper/navigation.dart';
import 'package:game_store/features/home/presentation/views/home_view.dart';
import 'package:game_store/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static String kHomeViewRoute = '/homeViewRoute';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeViewRoute,
        pageBuilder: (context, state) =>
            ScaleNavigation(screen: const HomeView()),
      )
    ],
  );
}
