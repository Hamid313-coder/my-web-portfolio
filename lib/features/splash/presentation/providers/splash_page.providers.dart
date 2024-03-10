import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/features/splash/presentation/viewmodel/splash_page.viewmodel.dart';

final splashPageViewModelProvider = Provider<SplashPageViewModel>((ref) {
  return SplashPageViewModel(ref);
});

final splashPageFutureProvider = FutureProvider<bool>((ref) {
  final splashVM = ref.read(splashPageViewModelProvider);
  return splashVM.preloadPages();
});
