import 'package:my_portfolio/features/twitter/data/models/twitter_page.model.dart';
import 'package:my_portfolio/features/twitter/data/repositories/itwitter.repository.dart';
import 'package:my_portfolio/styles/personal_portfolio_icons.dart';

class MockTwitterRepository implements ITwitterRepository {
  @override
  Future<TwitterPageModel> getTwitterData() async {
    return Future.delayed(const Duration(seconds: 2), () {
      return TwitterPageModel(
          icon: PersonalPortfolioIcons.twitter,
          title: 'Follow me',
          subtitle: 'on Twitter',
          handle: '@hamidhussainy1',
          url: 'https://twitter/hamidhussainy1');
    });
  }
}
