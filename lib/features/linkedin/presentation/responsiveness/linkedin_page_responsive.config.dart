import 'package:flutter/material.dart';
import 'package:my_portfolio/helpers/enums.dart';

class LinkedInPageResponsiveConfig {
  final double iconSize;
  final double titleSize;
  final double buttonLabelSize;
  final EdgeInsets buttonPadding;
  final EdgeInsets buttonMargin;

  LinkedInPageResponsiveConfig(
      {required this.iconSize,
      required this.titleSize,
      required this.buttonLabelSize,
      required this.buttonMargin,
      required this.buttonPadding});

  static Map<DeviceType, LinkedInPageResponsiveConfig> responsiveUI = {
    DeviceType.mobile: LinkedInPageResponsiveConfig(
      iconSize: 40,
      titleSize: 60,
      buttonLabelSize: 20,
      buttonMargin: const EdgeInsets.only(top: 20),
      buttonPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    ),
    DeviceType.tablet: LinkedInPageResponsiveConfig(
      iconSize: 60,
      titleSize: 80,
      buttonLabelSize: 20,
      buttonMargin: const EdgeInsets.only(top: 20),
      buttonPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    ),
    DeviceType.desktop: LinkedInPageResponsiveConfig(
      iconSize: 80,
      titleSize: 100,
      buttonLabelSize: 30,
      buttonMargin: const EdgeInsets.only(top: 20),
      buttonPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    ),
  };
}
