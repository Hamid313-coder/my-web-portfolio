import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/features/navigation/data/models/left_navigation_item.dart';
import 'package:my_portfolio/features/navigation/presentation/providers/navigation_providers.dart';

class LeftNavigationItemTile extends ConsumerWidget {
  final LeftNavigationItem item;

  const LeftNavigationItemTile({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedScale(
      scale: item.isSelected ? 1 : 0.8,
      duration: 0.25.seconds,
      curve: Curves.easeInOut,
      child: AnimatedOpacity(
        opacity: item.isSelected ? 1 : 0.25,
        duration: 0.25.seconds,
        curve: Curves.easeInOut,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: IconButton(
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
            icon: Icon(
              item.icon,
              color: Colors.white,
            ),
            onPressed: () {
              ref
                  .read(navigationItemsViewModelProvider.notifier)
                  .selectNavItem(item);
            },
          ),
        ),
      ),
    );
  }
}
