import 'package:go_router/go_router.dart';
import 'package:my_portfolio/features/github/presentation/pages/github.page.dart';
import 'package:my_portfolio/features/linkedin/presentation/pages/linkedin.page.dart';
import 'package:my_portfolio/features/shell/presentation/pages/portfolio_main.page.dart';
import 'package:my_portfolio/features/splash/presentation/pages/splash.page.dart';
import 'package:my_portfolio/features/twitter/presentation/pages/twitter.page.dart';
import 'package:my_portfolio/features/web/presentation/pages/web.page.dart';
import 'package:my_portfolio/features/welcome/presentation/pages/welcom.page.dart';
import 'package:my_portfolio/helpers/utils.dart';

class AppRoutes {
  static final GoRouter router = GoRouter(
      initialLocation: SplashPage.route,
      navigatorKey: Utils.mainNav,
      routes: [
        GoRoute(
          parentNavigatorKey: Utils.mainNav,
          path: SplashPage.route,
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
                  path: WelcomePage.route,
                  pageBuilder: (context, state) {
                    return const NoTransitionPage(child: WelcomePage());
                  }),
              GoRoute(
                  parentNavigatorKey: Utils.tabNav,
                  path: TwitterPage.route,
                  pageBuilder: (context, state) {
                    return const NoTransitionPage(child: TwitterPage());
                  }),
              GoRoute(
                  parentNavigatorKey: Utils.tabNav,
                  path: GithubPage.route,
                  pageBuilder: (context, state) {
                    return const NoTransitionPage(child: GithubPage());
                  }),
              GoRoute(
                  parentNavigatorKey: Utils.tabNav,
                  path: LinkedInPage.route,
                  pageBuilder: (context, state) {
                    return const NoTransitionPage(child: LinkedInPage());
                  }),
              GoRoute(
                  parentNavigatorKey: Utils.tabNav,
                  path: WebPage.route,
                  pageBuilder: (context, state) {
                    return const NoTransitionPage(child: WebPage());
                  }),
            ])
      ]);
}
