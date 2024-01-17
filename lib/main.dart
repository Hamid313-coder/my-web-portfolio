import 'package:flutter/material.dart';
import 'package:my_portfolio/routes/app_routes.dart';

void main() {
  return runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Portfolio App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Product Sans'),
      routeInformationProvider: AppRoutes.router.routeInformationProvider,
      routeInformationParser: AppRoutes.router.routeInformationParser,
      routerDelegate: AppRoutes.router.routerDelegate,
    );
  }
}
