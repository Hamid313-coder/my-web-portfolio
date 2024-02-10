import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/features/welcome/presentation/providers/welcom_page.providers.dart';
import 'package:my_portfolio/features/welcome/presentation/widgets/greeting_label.dart';
import 'package:my_portfolio/shared/widgets/error_notification.dart';
import 'package:my_portfolio/styles/colors.dart';
import 'package:my_portfolio/styles/personal_portfolio_icons.dart';

class WelcomePage extends ConsumerWidget {
  const WelcomePage({super.key});
  static const route = '/welcome-page';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final welcomeDataAsync = ref.watch(welcomeProvider);
    return welcomeDataAsync.when(
        loading: () => const Center(
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white))),
        error: (error, stackTrace) =>
            ErrorNotification(message: error.toString()),
        data: (welcomeData) {
          return Center(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: 140,
                          height: 140,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: PersonalPortfolioColors.welcomePrimary,
                                  width: 8),
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(welcomeData.imgPath),
                                  fit: BoxFit.cover))),
                      const SizedBox(width: 40),
                      const Icon(PersonalPortfolioIcons.wave,
                          size: 130, color: PersonalPortfolioColors.welcomeIcon)
                    ]),
                const GreetingsLabel(),
                Text.rich(
                  TextSpan(
                      style:
                          const TextStyle(fontSize: 100, color: Colors.white),
                      children: [
                        const TextSpan(text: "I'm "),
                        TextSpan(
                            text: welcomeData.name,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                      ]),
                  textAlign: TextAlign.center,
                ),
                Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(PersonalPortfolioIcons.badge,
                          color: PersonalPortfolioColors.welcomePrimary,
                          size: 80),
                      const SizedBox(width: 20),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(welcomeData.title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 40, color: Colors.white)),
                          Text(welcomeData.subTitle,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 40, color: Colors.white)),
                        ],
                      )
                    ])
              ]));
        });
  }
}
