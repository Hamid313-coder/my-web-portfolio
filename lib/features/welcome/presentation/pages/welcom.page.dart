import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/features/welcome/presentation/providers/welcom_page.providers.dart';
import 'package:my_portfolio/features/welcome/presentation/responsiveness.dart/welcome_page_responsive.config.dart';
import 'package:my_portfolio/features/welcome/presentation/widgets/greeting_label.dart';
import 'package:my_portfolio/helpers/responsive_ui_helper.dart';
import 'package:my_portfolio/shared/widgets/error_notification.dart';
import 'package:my_portfolio/styles/colors.dart';
import 'package:my_portfolio/styles/personal_portfolio_icons.dart';
import 'package:flutter_animate/flutter_animate.dart';

class WelcomePage extends ConsumerWidget {
  const WelcomePage({super.key});
  static const route = '/welcome-page';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var uiConfig = WelcomePageResponsiveConfig
        .responsiveUI[ResponsiveUIHelper.getDeviceType(context)]!;
    final welcomeDataAsync = ref.watch(welcomeProvider);
    return welcomeDataAsync.when(
        loading: () => const Center(
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white))),
        error: (error, stackTrace) =>
            ErrorNotification(message: error.toString()),
        data: (welcomeData) {
          return Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flex(
                        direction: uiConfig.headerAxis,
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              width: uiConfig.imageSize,
                              height: uiConfig.imageSize,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: PersonalPortfolioColors
                                          .welcomePrimary,
                                      width: 8),
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(welcomeData.imgPath),
                                      fit: BoxFit.cover))),
                          uiConfig.headerGap,
                          Icon(PersonalPortfolioIcons.wave,
                                  size: uiConfig.handSize,
                                  color: PersonalPortfolioColors.welcomeIcon)
                              .animate(onPlay: (controller) {
                            controller.repeat(reverse: true);
                          }).rotate(
                            begin: -0.25,
                            end: 0,
                            duration: 0.5.seconds,
                            curve: Curves.easeInOut,
                          )
                        ]),
                    const GreetingsLabel(),
                    Text.rich(
                      TextSpan(
                          style: TextStyle(
                              fontSize: uiConfig.titleSize,
                              color: Colors.white),
                          children: [
                            const TextSpan(text: "I'm "),
                            TextSpan(
                                text: welcomeData.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                          ]),
                      textAlign: TextAlign.center,
                    ),
                    Flex(
                        direction: uiConfig.headerAxis,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(PersonalPortfolioIcons.badge,
                              color: PersonalPortfolioColors.welcomePrimary,
                              size: uiConfig.badgeSize),
                          uiConfig.subtitleGap,
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(welcomeData.title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: uiConfig.subTitleSize,
                                      color: Colors.white)),
                              Text(welcomeData.subTitle,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: uiConfig.subTitleSize,
                                      color: Colors.white)),
                            ],
                          )
                        ])
                  ]
                      .animate(interval: 100.ms)
                      .slideY(
                        begin: 1,
                        end: 0,
                        curve: Curves.easeInOut,
                        duration: 0.5.seconds,
                      )
                      .fadeIn()));
        });
  }
}
