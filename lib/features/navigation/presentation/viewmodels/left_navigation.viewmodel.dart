import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_portfolio/features/navigation/data/models/left_navigation_item.dart';
import 'package:my_portfolio/helpers/utils.dart';

class LeftNavigationViewModel extends StateNotifier<List<LeftNavigationItem>> {
  Ref ref;
  LeftNavigationViewModel(List<LeftNavigationItem> items, this.ref)
      : super([]) {
    state = items;
    final item = items.first;
    selectNavItem(item);
  }

  void selectNavItem(LeftNavigationItem item) {
    if (item.route.isNotEmpty) {
      GoRouter.of(Utils.tabNav.currentContext!).go(item.route);
    }
    state = [
      for (final element in state) item.copyWith(isSelected: element == item),
    ];
  }
}
