import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/features/web/presentation/providers/web.providers.dart';
import 'package:my_portfolio/shared/widgets/error_notification.dart';
import 'package:my_portfolio/styles/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class WebPage extends ConsumerWidget {
  const WebPage({super.key});

  static String route = '/web';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final webAsyncData = ref.watch(webProvider);
    return webAsyncData.when(
        loading: () => const Center(
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white))),
        error: (error, stackTrace) =>
            ErrorNotification(message: error.toString()),
        data: (webData) => Center(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(webData.icon,
                        size: 80, color: PersonalPortfolioColors.webIcon)
                    .animate(onPlay: (controller) {
                  controller.repeat(reverse: true);
                }).scaleXY(
                        duration: 1.seconds,
                        begin: 0.8,
                        end: 1,
                        curve: Curves.easeInOut),
                Text(webData.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 100,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () => launchUrl(Uri.parse(webData.url)),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: Colors.white.withOpacity(0.1)),
                    child: Text(
                      webData.subtitle,
                      style: const TextStyle(
                          fontSize: 20, color: PersonalPortfolioColors.webIcon),
                    ),
                  ),
                )
              ]
                  .animate(interval: 100.ms)
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
