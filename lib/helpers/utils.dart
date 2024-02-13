import 'package:flutter/material.dart';
import 'package:my_portfolio/features/github/presentation/pages/github.page.dart';
import 'package:my_portfolio/features/linkedin/presentation/pages/linkedin.page.dart';
import 'package:my_portfolio/features/twitter/presentation/pages/twitter.page.dart';
import 'package:my_portfolio/features/web/presentation/pages/web.page.dart';
import 'package:my_portfolio/features/welcome/presentation/pages/welcom.page.dart';
import 'package:my_portfolio/helpers/enums.dart';

class Utils {
  static GlobalKey<NavigatorState> mainNav = GlobalKey();

  static GlobalKey<NavigatorState> tabNav = GlobalKey();

  static GlobalKey<ScaffoldState> mainScaffold = GlobalKey();

  static Map<String, BackgroundAnimations> pageRouteToAnimations = {
    WelcomePage.route: BackgroundAnimations.welcome,
    TwitterPage.route: BackgroundAnimations.twitter,
    LinkedInPage.route: BackgroundAnimations.linkedin,
    GithubPage.route: BackgroundAnimations.github,
    WebPage.route: BackgroundAnimations.web
  };
}
