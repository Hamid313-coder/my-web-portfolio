import 'package:my_portfolio/features/twitter/data/models/twitter_page.model.dart';
import 'package:my_portfolio/features/twitter/data/repositories/itwitter.repository.dart';

class TwitterViewModel {
  TwitterViewModel(this.twitterRepository);

  final ITwitterRepository twitterRepository;

  Future<TwitterPageModel> getTwitterData() {
    return twitterRepository.getTwitterData();
  }
}
