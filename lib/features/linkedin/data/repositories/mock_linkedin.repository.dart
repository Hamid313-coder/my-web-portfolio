import 'package:my_portfolio/features/linkedin/data/models/linkedin_page.model.dart';
import 'package:my_portfolio/features/linkedin/data/repositories/ilinkedin.repository.dart';
import 'package:my_portfolio/styles/personal_portfolio_icons.dart';

class MockLinkedInRepository implements ILinkedInRepository {
  @override
  Future<LinkedInPageModel> getLinkedInData() async {
    return Future.delayed(const Duration(seconds: 2), () {
      return LinkedInPageModel(
          icon: PersonalPortfolioIcons.linkedin,
          title: 'Let\'s\nConnect',
          subtitle: 'on LinkedIn',
          url: 'https://www.linkedin.com/in/hamidullah-hussainy-a8955121a');
    });
  }
}
