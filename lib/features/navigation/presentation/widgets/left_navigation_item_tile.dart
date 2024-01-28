import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/features/navigation/data/models/left_navigation_item.dart';
import 'package:my_portfolio/features/navigation/presentation/providers/navigation_providers.dart';

class LeftNavigationItemTile extends ConsumerWidget {
  final LeftNavigationItem item;

  const LeftNavigationItemTile({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navItemColor =
        item.isSelected ? Colors.white : Colors.white.withOpacity(0.25);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: IconButton(
        icon: Icon(
          item.icon,
          color: navItemColor,
        ),
        onPressed: () {
          ref
              .read(navigationItemsViewModelProvider.notifier)
              .selectNavItem(item);
        },
      ),
    );
  }
}
