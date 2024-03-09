import 'package:flutter/material.dart';
import 'package:my_portfolio/styles/personal_portfolio_icons.dart';

class WebPageModel {
  final IconData icon;
  final String title;
  final String subtitle;
  final String url;

  WebPageModel(
      {required this.icon,
      required this.title,
      required this.subtitle,
      required this.url});

  factory WebPageModel.fromDatabase(Map<String, dynamic> doc) {
    return WebPageModel(
      icon: PersonalPortfolioIcons.iconFromName(doc['icon']),
      title: (doc['title'] as String).replaceAll('\\n', '\n'),
      subtitle: doc['subtitle'],
      url: doc['url'],
    );
  }
}
