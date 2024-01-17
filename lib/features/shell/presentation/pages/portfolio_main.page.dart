import 'package:flutter/material.dart';
import 'package:my_portfolio/helpers/utils.dart';

class PortfolioMainPage extends StatelessWidget {
  const PortfolioMainPage({required this.child, super.key});
  static const String routeName = '/main';

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(key: Utils.mainScaffold, body: child);
  }
}
