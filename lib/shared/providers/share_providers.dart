import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/features/welcome/presentation/pages/welcom.page.dart';
import 'package:my_portfolio/shared/repositories/database_provider.dart';
import 'package:my_portfolio/styles/colors.dart';

final pageColorProvider = StateProvider<LinearGradient>((ref) {
  return PersonalPortfolioColors.pageColor[WelcomePage.route]!;
});

final bgPageRouteProvider = StateProvider<String>((ref) {
  return WelcomePage.route;
});

final firebaseDbInstanceProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});

final dbProvider = Provider<DatabaseProvider>((ref) {
  return DatabaseProvider(ref);
});
