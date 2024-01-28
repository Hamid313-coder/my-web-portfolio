import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/features/navigation/data/models/left_navigation_item.dart';
import 'package:my_portfolio/features/navigation/data/repositories/inavigation.repository.dart';
import 'package:my_portfolio/features/navigation/data/repositories/mock_navigation.repository.dart';
import 'package:my_portfolio/features/navigation/presentation/viewmodels/left_navigation.viewmodel.dart';

final navigationRepositoryProvider = Provider<INavigationRepository>((ref) {
  return MockNavigationRepository();
});

final navigationItemsProvider = Provider<List<LeftNavigationItem>>((ref) {
  return ref.read(navigationRepositoryProvider).getDefaultNavItems();
});

final navigationItemsViewModelProvider =
    StateNotifierProvider<LeftNavigationViewModel, List<LeftNavigationItem>>(
  (ref) {
    final items = ref.read(navigationItemsProvider);
    return LeftNavigationViewModel(items, ref);
  },
);
