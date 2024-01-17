import 'package:go_router/go_router.dart';
import 'package:my_portfolio/features/shell/presentation/pages/portfolio_main.page.dart';
import 'package:my_portfolio/features/splash/presentation/pages/splash.page.dart';
import 'package:my_portfolio/features/welcome/presentation/pages/welcom.page.dart';
import 'package:my_portfolio/helpers/utils.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
      initialLocation: SplashPage.routeName,
      navigatorKey: Utils.mainNav,
      routes: [
        GoRoute(
          parentNavigatorKey: Utils.mainNav,
          path: SplashPage.routeName,
          builder: (context, state) => const SplashPage(),
        ),
        ShellRoute(
            navigatorKey: Utils.tabNav,
            builder: (context, state, child) {
              return PortfolioMainPage(child: child);
            },
            routes: [
              GoRoute(
                  parentNavigatorKey: Utils.tabNav,
                  path: WelcomePage.routeName,
                  pageBuilder: (context, state) {
                    return const NoTransitionPage(child: WelcomePage());
                  }),
            ])
      ]);
}
