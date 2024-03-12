import 'package:flutter/material.dart';
import 'package:my_portfolio/helpers/enums.dart';

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
