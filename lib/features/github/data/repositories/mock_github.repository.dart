import 'package:my_portfolio/features/github/data/models/github_page.model.dart';
import 'package:my_portfolio/features/github/data/repositories/igithub.repository.dart';
import 'package:my_portfolio/styles/personal_portfolio_icons.dart';

class MockGithubRepository implements IGithubRepository {
  @override
  Future<GithubPageModel> getGithubData() async {
    return Future.delayed(const Duration(seconds: 2), () {
      return GithubPageModel(
          icon: PersonalPortfolioIcons.github,
          title: 'Check out\nMy Repos',
          handle: 'on Github',
          url: 'https://github.com/Hamid313-coder');
    });
  }
}
