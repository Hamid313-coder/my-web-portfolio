import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/features/web/data/models/web_page.model.dart';
import 'package:my_portfolio/features/web/data/repositories/iweb.repository.dart';
import 'package:my_portfolio/helpers/enums.dart';
import 'package:my_portfolio/shared/providers/share_providers.dart';

class WebRepository extends IWebRepository {
  Ref ref;

  WebRepository(this.ref);

  @override
  Future<WebPageModel> getWebData() {
    return ref.read(dbProvider).getPageDataFromDB(
          WebPageModel.fromDatabase,
          DatabaseCollections.pageContent.name,
          DatabaseDocs.webPage.name,
        );
  }
}
