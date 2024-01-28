import 'package:my_portfolio/features/navigation/data/models/left_navigation_item.dart';
import 'package:my_portfolio/features/navigation/data/repositories/inavigation.repository.dart';
import 'package:my_portfolio/features/welcome/presentation/pages/welcom.page.dart';
import 'package:my_portfolio/styles/personal_portfolio_icons.dart';

class MockNavigationRepository implements INavigationRepository {
  @override
  List<LeftNavigationItem> getDefaultNavItems() {
    return [
      LeftNavigationItem(
          icon: PersonalPortfolioIcons.user,
          label: 'My Profile',
          route: WelcomePage.routeName,
          isSelected: true),
      LeftNavigationItem(
          icon: PersonalPortfolioIcons.twitter,
          label: 'Twitter',
          route: '',
          isSelected: false),
      LeftNavigationItem(
          icon: PersonalPortfolioIcons.linkedin,
          label: 'LinkedIn',
          route: '',
          isSelected: false),
      LeftNavigationItem(
          icon: PersonalPortfolioIcons.web,
          label: 'Web',
          route: '',
          isSelected: false),
      LeftNavigationItem(
          icon: PersonalPortfolioIcons.github,
          label: 'Github',
          route: '',
          isSelected: false),
    ];
  }
}
