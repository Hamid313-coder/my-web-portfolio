import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});
  static const routeName = '/welcome-page';

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('welcome page!'));
  }
}
