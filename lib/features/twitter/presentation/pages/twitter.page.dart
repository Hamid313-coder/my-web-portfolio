import 'package:flutter/material.dart';
import 'package:my_portfolio/styles/colors.dart';
import 'package:my_portfolio/styles/personal_portfolio_icons.dart';

class TwitterPage extends StatelessWidget {
  const TwitterPage({super.key});

  static const String route = '/twitter';

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(PersonalPortfolioIcons.twitter,
            size: 80, color: PersonalPortfolioColors.twitterIcon),
        const Text('Follow me',
            style: TextStyle(
                color: Colors.white,
                fontSize: 100,
                fontWeight: FontWeight.bold)),
        const Text('on Twitter',
            style: TextStyle(
                color: PersonalPortfolioColors.twitterIcon, fontSize: 40)),
        const SizedBox(height: 6),
        GestureDetector(
          onTap: () => print('salam'),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: Colors.white.withOpacity(0.1)),
            child: const Text(
              '@hamidhussainy1',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        )
      ],
    ));
  }
}
