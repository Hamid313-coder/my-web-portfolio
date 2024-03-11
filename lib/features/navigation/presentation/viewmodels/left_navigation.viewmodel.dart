import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_portfolio/features/navigation/data/models/left_navigation_item.dart';
import 'package:my_portfolio/helpers/utils.dart';
import 'package:my_portfolio/shared/providers/share_providers.dart';
import 'package:my_portfolio/styles/colors.dart';

class LeftNavigationViewModel extends StateNotifier<List<LeftNavigationItem>> {
  Ref ref;
  LeftNavigationViewModel(List<LeftNavigationItem> items, this.ref)
      : super([]) {
    state = items;
  }

  void selectNavItem(LeftNavigationItem item) {
    if (item.route.isNotEmpty) {
      GoRouter.of(Utils.tabNav.currentContext!).go(item.route);
    }
    ref.read(pageColorProvider.notifier).state =
        PersonalPortfolioColors.pageColor[item.route]!;
    ref.read(bgPageRouteProvider.notifier).state = item.route;
    state = [
      for (final element in state)
        element.copyWith(isSelected: element == item),
    ];

    ref.read(webLocalStorageProvider).storeSelectedNav(item.route);
  }

  void init() {
    var selectedNavRoute = ref.read(webLocalStorageProvider).getSelectedNav();

    if (selectedNavRoute.isNotEmpty) {
      var item = state.where((i) => i.route == selectedNavRoute).first;
      selectNavItem(item);
    } else {
      selectNavItem(state.first);
    }
  }
}
