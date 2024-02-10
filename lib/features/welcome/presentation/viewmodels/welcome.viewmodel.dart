import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/features/welcome/data/models/welcome_page.model.dart';
import 'package:my_portfolio/features/welcome/data/repositories/iwelcome.repository.dart';
import 'package:my_portfolio/features/welcome/presentation/providers/welcom_page.providers.dart';

class WelcomePageVieModel {
  final Ref ref;
  final IWelcomeRepository welcomeRepository;

  WelcomePageVieModel(this.welcomeRepository, this.ref);

  Future<WelcomePageModel> getWelcomePageData() async {
    final welcomePageData = await welcomeRepository.getWelcomePageData();
    ref.read(greetingsRawListProvider.notifier).state =
        welcomePageData.greetings;
    return welcomePageData;
  }
}
