import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_portfolio/features/splash/presentation/providers/splash_page.providers.dart';
import 'package:my_portfolio/features/splash/presentation/widgets/splash_laoding.dart';
import 'package:my_portfolio/features/welcome/presentation/pages/welcom.page.dart';
import 'package:my_portfolio/helpers/utils.dart';
import 'package:my_portfolio/shared/widgets/error_notification.dart';
import 'package:my_portfolio/styles/colors.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  static const String route = '/';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var splashFuture = ref.watch(splashPageFutureProvider);
    var loadingMessage = const SplashLoading(
        message: 'Loading an awesome,\nKick-ass Profile...');

    return Scaffold(
        backgroundColor: PersonalPortfolioColors.mainBlue,
        body: splashFuture.when(
          loading: () => loadingMessage,
          error: (error, stackTrace) =>
              ErrorNotification(message: error.toString()),
          data: (data) {
            Future.delayed(1.seconds, () {
              GoRouter.of(Utils.mainNav.currentContext!).go(WelcomePage.route);
            });

            return loadingMessage;
          },
        ));
  }
}
