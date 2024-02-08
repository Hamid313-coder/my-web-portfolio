import 'package:my_portfolio/features/welcome/data/models/welcome_page.model.dart';
import 'package:my_portfolio/features/welcome/data/repositories/iwelcome.repository.dart';

class MockWelcomRepository implements IWelcomeRepository {
  @override
  Future<WelcomePageModel> getWelcomePageData() {
    return Future.delayed(const Duration(seconds: 2), () {
      return WelcomePageModel(
          name: 'Hamid',
          title: 'Flutter Developer',
          subTitle: 'Juior Software Engineer',
          imgPath: 'https://avatars.githubusercontent.com/u/77102797?v=4',
          greetings: ["hello", "salam", "hola", "bonjour", "ciao"]);
    });
  }
}
