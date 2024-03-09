import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/features/github/data/models/github_page.model.dart';
import 'package:my_portfolio/features/github/data/repositories/igithub.repository.dart';
import 'package:my_portfolio/helpers/enums.dart';
import 'package:my_portfolio/shared/providers/share_providers.dart';

class GithubRepository extends IGithubRepository {
  Ref ref;

  GithubRepository(this.ref);
  @override
  Future<GithubPageModel> getGithubData() {
    return ref.read(dbProvider).getPageDataFromDB(
          GithubPageModel.fromDatabase,
          DatabaseCollections.pageContent.name,
          DatabaseDocs.githubPage.name,
        );
  }
}
