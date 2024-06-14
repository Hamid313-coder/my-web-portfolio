import 'package:flutter/material.dart';
import 'package:my_portfolio/features/navigation/presentation/responsiveness/navigation_responsive.config.dart';
import 'package:my_portfolio/features/navigation/presentation/widgets/left_navigation.dart';
import 'package:my_portfolio/features/navigation/presentation/widgets/side_navigation_drawer.dart';
import 'package:my_portfolio/helpers/responsive_ui_helper.dart';
import 'package:my_portfolio/helpers/utils.dart';
import 'package:my_portfolio/shared/widgets/bg_animation.dart';
import 'package:my_portfolio/shared/widgets/pagecolor.dart';
import 'package:my_portfolio/styles/colors.dart';

class PortfolioMainPage extends StatelessWidget {
  const PortfolioMainPage({required this.child, super.key});
  static const String route = '/main';

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: Utils.mainScaffold,
        drawer: const SideNavigationDrawer(),
        backgroundColor: PersonalPortfolioColors.mainBlue,
        body: Builder(builder: (context) {
          var navUIConfig = NavigationResponsiveConfig
              .responsiveUI[ResponsiveUIHelper.getDeviceType(context)]!;
          if (!navUIConfig.showSideBar &&
              Utils.mainScaffold.currentState!.isDrawerOpen) {
            Utils.mainScaffold.currentState!.closeDrawer();
          }
          return Stack(
            children: [
              const PageColor(),
              const BgAnimation(),
              Center(child: child),
              const Align(
                alignment: Alignment.centerLeft,
                child: LeftNavigation(),
              ),
            ],
          );
        }));
  }
}
