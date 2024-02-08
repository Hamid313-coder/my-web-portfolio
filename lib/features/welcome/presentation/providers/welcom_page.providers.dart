import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/features/welcome/data/repositories/iwelcome.repository.dart';
import 'package:my_portfolio/features/welcome/data/repositories/mockwelcome.repository.dart';
import 'package:my_portfolio/features/welcome/presentation/viewmodels/welcome.viewmodel.dart';

final welcomeRepositoryProvider = Provider<IWelcomeRepository>((ref) {
  return MockWelcomRepository();
});

final welcomeViewModelProvider = Provider<WelcomePageVieModel>((ref) {
  final welcomeRepository = ref.read(welcomeRepositoryProvider);
  return WelcomePageVieModel(welcomeRepository, ref);
});

final welcomeProvider = FutureProvider((ref) {
  final welcomeVM = ref.read(welcomeViewModelProvider);
  return welcomeVM.getWelcomePageData();
});
