import 'package:flutter/material.dart';
import 'package:my_portfolio/helpers/enums.dart';
import 'package:my_portfolio/shared/models/iresponsive.config.dart';

class WebPageResponsiveConfig implements IResponsiveConfig {
  final double iconSize;
  final double titleSize;
  final double buttonLabelSize;
  final EdgeInsets buttonPadding;
  final EdgeInsets buttonMargin;

  WebPageResponsiveConfig(
      {required this.iconSize,
      required this.titleSize,
      required this.buttonLabelSize,
      required this.buttonMargin,
      required this.buttonPadding});

  static Map<DeviceType, WebPageResponsiveConfig> responsiveUI = {
    DeviceType.mobile: WebPageResponsiveConfig(
      iconSize: 40,
      titleSize: 60,
      buttonLabelSize: 20,
      buttonMargin: const EdgeInsets.only(top: 20),
      buttonPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    ),
    DeviceType.tablet: WebPageResponsiveConfig(
      iconSize: 60,
      titleSize: 80,
      buttonLabelSize: 20,
      buttonMargin: const EdgeInsets.only(top: 20),
      buttonPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    ),
    DeviceType.desktop: WebPageResponsiveConfig(
      iconSize: 80,
      titleSize: 100,
      buttonLabelSize: 30,
      buttonMargin: const EdgeInsets.only(top: 20),
      buttonPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    ),
  };
}
