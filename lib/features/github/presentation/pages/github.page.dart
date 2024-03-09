import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/features/github/presentation/providers/github.providers.dart';
import 'package:my_portfolio/shared/widgets/error_notification.dart';
import 'package:my_portfolio/styles/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class GithubPage extends ConsumerWidget {
  const GithubPage({super.key});

  static String route = '/github';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final githubAsyncData = ref.watch(githubProvider);
    return githubAsyncData.when(
        loading: () => const Center(
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white))),
        error: (error, stackTrace) =>
            ErrorNotification(message: error.toString()),
        data: (githubData) => Center(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(githubData.icon,
                        size: 80, color: PersonalPortfolioColors.githubIcon)
                    .animate(onPlay: (controller) {
                  controller.repeat(reverse: true);
                }).scaleXY(
                        duration: 1.seconds,
                        begin: 0.8,
                        end: 1,
                        curve: Curves.easeInOut),
                Text(githubData.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 100,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () => launchUrl(Uri.parse(githubData.url)),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: Colors.white.withOpacity(0.1)),
                    child: Text(
                      githubData.subtitle,
                      style: const TextStyle(
                          fontSize: 20,
                          color: PersonalPortfolioColors.githubIcon),
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
