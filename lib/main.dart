import 'package:flutter/material.dart';
import 'package:my_portfolio/routes/app_routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/shared/repositories/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  return runApp(const ProviderScope(child: PortfolioApp()));
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
