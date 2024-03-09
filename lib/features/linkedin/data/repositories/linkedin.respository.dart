import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/features/linkedin/data/models/linkedin_page.model.dart';
import 'package:my_portfolio/features/linkedin/data/repositories/ilinkedin.repository.dart';
import 'package:my_portfolio/helpers/enums.dart';
import 'package:my_portfolio/shared/providers/share_providers.dart';

class LinkedInRepository extends ILinkedInRepository {
  Ref ref;
  LinkedInRepository(this.ref);

  @override
  Future<LinkedInPageModel> getLinkedInData() {
    return ref.read(dbProvider).getPageDataFromDB(
          LinkedInPageModel.fromDatabase,
          DatabaseCollections.pageContent.name,
          DatabaseDocs.linkedInPage.name,
        );
  }
}
