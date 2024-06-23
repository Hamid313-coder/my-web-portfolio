import 'package:flutter/material.dart';
import 'package:my_portfolio/features/github/presentation/responsiveness/github_page_responsive.config.dart';
import 'package:my_portfolio/features/linkedin/presentation/responsiveness/linkedin_page_responsive.config.dart';
import 'package:my_portfolio/features/navigation/presentation/responsiveness/navigation_responsive.config.dart';
import 'package:my_portfolio/features/twitter/presentation/responsiveness/twitter_page_responsive.config.dart';
import 'package:my_portfolio/features/web/presentation/responsiveness/web_page_responsive.config.dart';
import 'package:my_portfolio/features/welcome/presentation/responsiveness.dart/welcome_page_responsive.config.dart';
import 'package:my_portfolio/helpers/enums.dart';
import 'package:my_portfolio/shared/models/iresponsive.config.dart';

extension GetResponsiveUIConfig on BuildContext {
  T uiConfig<T>() {
    late IResponsiveConfig configClass;
    DeviceType device = ResponsiveUIHelper.getDeviceType(this);

    switch (T) {
      case WelcomePageResponsiveConfig:
        configClass = WelcomePageResponsiveConfig.responsiveUI[device]!;
        break;
      case TwitterPageResponsiveConfig:
        configClass = TwitterPageResponsiveConfig.responsiveUI[device]!;
        break;
      case NavigationResponsiveConfig:
        configClass = NavigationResponsiveConfig.responsiveUI[device]!;
        break;
      case LinkedInPageResponsiveConfig:
        configClass = LinkedInPageResponsiveConfig.responsiveUI[device]!;
        break;
      case WebPageResponsiveConfig:
        configClass = WebPageResponsiveConfig.responsiveUI[device]!;
        break;
      case GithubPageResponsiveConfig:
        configClass = GithubPageResponsiveConfig.responsiveUI[device]!;
        break;
    }

    return configClass as T;
  }
}

class ResponsiveUIHelper {
  // our supported max window width sizes
  static const int mobileMaxWidth = 375;
  static const int tabletMaxWidth = 768;
  static const int desktopMaxWidth = 1024;

  static DeviceType getDeviceType(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    final deviceWidth = deviceSize.width;

    if (deviceWidth > ResponsiveUIHelper.desktopMaxWidth) {
      return DeviceType.desktop;
    }

    if (deviceWidth > ResponsiveUIHelper.tabletMaxWidth) {
      return DeviceType.tablet;
    }

    return DeviceType.mobile;
  }
}
