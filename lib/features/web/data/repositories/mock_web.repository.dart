import 'package:my_portfolio/features/web/data/models/web_page.model.dart';
import 'package:my_portfolio/features/web/data/repositories/iweb.repository.dart';
import 'package:my_portfolio/styles/personal_portfolio_icons.dart';

class MockWebRepository implements IWebRepository {
  @override
  Future<WebPageModel> getWebData() async {
    return Future.delayed(const Duration(seconds: 2), () {
      return WebPageModel(
          icon: PersonalPortfolioIcons.web,
          title: 'Visit\nMy Page',
          subtitle: 'on Web',
          url: 'https://github.com/Hamid313-coder');
    });
  }
}
