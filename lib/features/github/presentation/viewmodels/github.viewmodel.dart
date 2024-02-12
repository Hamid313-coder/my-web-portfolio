import 'package:my_portfolio/features/github/data/models/github_page.model.dart';
import 'package:my_portfolio/features/github/data/repositories/igithub.repository.dart';

class GithubViewModel {
  final IGithubRepository githubRepository;
  GithubViewModel(this.githubRepository);

  Future<GithubPageModel> getLinkedData() {
    return githubRepository.getGithubData();
  }
}
