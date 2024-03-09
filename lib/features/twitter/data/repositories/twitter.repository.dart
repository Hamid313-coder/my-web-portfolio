import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/features/twitter/data/models/twitter_page.model.dart';
import 'package:my_portfolio/features/twitter/data/repositories/itwitter.repository.dart';
import 'package:my_portfolio/helpers/enums.dart';
import 'package:my_portfolio/shared/providers/share_providers.dart';

class TwitterRepository extends ITwitterRepository {
  Ref ref;
  TwitterRepository(this.ref);

  @override
  Future<TwitterPageModel> getTwitterData() {
    return ref.read(dbProvider).getPageDataFromDB(
          TwitterPageModel.fromDatabase,
          DatabaseCollections.pageContent.name,
          DatabaseDocs.twitterPage.name,
        );
  }
}
