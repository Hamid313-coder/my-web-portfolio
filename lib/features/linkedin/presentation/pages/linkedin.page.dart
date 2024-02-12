import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/features/linkedin/presentation/providers/linkedin.providers.dart';
import 'package:my_portfolio/shared/widgets/error_notification.dart';
import 'package:my_portfolio/styles/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkedInPage extends ConsumerWidget {
  const LinkedInPage({super.key});

  static String route = '/linkedin';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final linkedInAsyncData = ref.watch(linkedInProvider);
    return linkedInAsyncData.when(
        loading: () => const Center(
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white))),
        error: (error, stackTrace) =>
            ErrorNotification(message: error.toString()),
        data: (linkedInData) => Center(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(linkedInData.icon,
                    size: 80, color: PersonalPortfolioColors.twitterIcon),
                Text(linkedInData.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 100,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () => launchUrl(Uri.parse(linkedInData.url)),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: Colors.white.withOpacity(0.1)),
                    child: Text(
                      linkedInData.handle,
                      style: const TextStyle(
                          fontSize: 20,
                          color: PersonalPortfolioColors.linkedInIcon),
                    ),
                  ),
                )
              ],
            )));
  }
}
