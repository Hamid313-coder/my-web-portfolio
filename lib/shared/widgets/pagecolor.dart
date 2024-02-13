import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/shared/providers/share_providers.dart';

class PageColor extends ConsumerWidget {
  const PageColor({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageGradient = ref.watch(pageColorProvider);
    return AnimatedContainer(
      duration: 1.seconds,
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        gradient: pageGradient,
      ),
    );
  }
}
