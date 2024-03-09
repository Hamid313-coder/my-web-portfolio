import 'package:flutter/material.dart';
import 'package:my_portfolio/styles/personal_portfolio_icons.dart';

class LinkedInPageModel {
  final IconData icon;
  final String title;
  final String subtitle;
  final String url;

  LinkedInPageModel(
      {required this.icon,
      required this.title,
      required this.subtitle,
      required this.url});

  factory LinkedInPageModel.fromDatabase(Map<String, dynamic> doc) {
    return LinkedInPageModel(
      icon: PersonalPortfolioIcons.iconFromName(doc['icon']),
      title: (doc['title'] as String).replaceAll('\\n', '\n'),
      subtitle: doc['subtitle'],
      url: doc['url'],
    );
  }
}
