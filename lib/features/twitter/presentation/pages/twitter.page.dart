import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/features/twitter/presentation/providers/twitter.providers.dart';
import 'package:my_portfolio/shared/widgets/error_notification.dart';
import 'package:my_portfolio/styles/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class TwitterPage extends ConsumerWidget {
  const TwitterPage({super.key});

  static const String route = '/twitter';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final twitterDataAsync = ref.watch(twitterProvider);
    return twitterDataAsync.when(
        loading: () => const Center(
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white))),
        error: (error, stackTrace) =>
            ErrorNotification(message: error.toString()),
        data: (twitterData) => Center(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(twitterData.icon,
                        size: 80, color: PersonalPortfolioColors.twitterIcon)
                    .animate(onPlay: (controller) {
                      controller.repeat(reverse: true);
                    })
                    .scaleXY(
                        duration: 0.8.seconds,
                        begin: 0.8,
                        end: 1,
                        curve: Curves.easeInOut)
                    .slideY(
                        duration: 0.8.seconds,
                        begin: -0.2,
                        end: 0,
                        curve: Curves.easeInOut),
                Text(twitterData.title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 100,
                        fontWeight: FontWeight.bold)),
                Text(twitterData.subtitle,
                    style: const TextStyle(
                        color: PersonalPortfolioColors.twitterIcon,
                        fontSize: 40)),
                const SizedBox(height: 6),
                GestureDetector(
                  onTap: () => launchUrl(Uri.parse(twitterData.url)),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: Colors.white.withOpacity(0.1)),
                    child: Text(
                      twitterData.handle,
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                )
              ]
                  .animate(interval: 80.ms)
                  .slideY(
                    begin: 1,
                    end: 0,
                    curve: Curves.easeInOut,
                    duration: 0.5.seconds,
                  )
                  .fadeIn(),
            )));
  }
}
