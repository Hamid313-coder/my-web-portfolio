import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/features/welcome/data/models/welcome_page.model.dart';
import 'package:my_portfolio/features/welcome/data/repositories/iwelcome.repository.dart';

class WelcomePageVieModel {
  final Ref ref;
  final IWelcomeRepository welcomeRepository;

  WelcomePageVieModel(this.welcomeRepository, this.ref);

  Future<WelcomePageModel> getWelcomePageData() async {
    final welcomePageData = await welcomeRepository.getWelcomePageData();
    return welcomePageData;
  }
}
