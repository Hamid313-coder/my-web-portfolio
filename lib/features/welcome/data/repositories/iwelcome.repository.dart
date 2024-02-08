import 'package:my_portfolio/features/welcome/data/models/welcome_page.model.dart';

abstract class IWelcomeRepository {
  Future<WelcomePageModel> getWelcomePageData();
}
