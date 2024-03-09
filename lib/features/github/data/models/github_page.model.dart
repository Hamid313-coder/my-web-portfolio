import 'package:flutter/material.dart';
import 'package:my_portfolio/styles/personal_portfolio_icons.dart';

class GithubPageModel {
  final IconData icon;
  final String title;
  final String subtitle;
  final String url;

  GithubPageModel(
      {required this.icon,
      required this.title,
      required this.subtitle,
      required this.url});

  factory GithubPageModel.fromDatabase(Map<String, dynamic> doc) {
    return GithubPageModel(
      icon: PersonalPortfolioIcons.iconFromName(doc['icon']),
      title: (doc['title'] as String).replaceAll('\\n', '\n'),
      subtitle: doc['subtitle'],
      url: doc['url'],
    );
  }
}
