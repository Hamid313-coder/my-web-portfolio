import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_portfolio/features/splash/presentation/widgets/splash_laoding.dart';
import 'package:my_portfolio/features/welcome/presentation/pages/welcom.page.dart';
import 'package:my_portfolio/helpers/utils.dart';
import 'package:my_portfolio/styles/colors.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      GoRouter.of(Utils.mainNav.currentContext!).go(WelcomePage.routeName);
    });

    return const Scaffold(
        backgroundColor: PersonalPortfolioColors.mainBlue,
        body: SplashLoading(
          message: 'Loading an awesome,\nperfect portfolio',
        ));
  }
}
