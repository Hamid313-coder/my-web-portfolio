import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/features/github/data/repositories/igithub.repository.dart';
import 'package:my_portfolio/features/github/data/repositories/mock_github.repository.dart';
import 'package:my_portfolio/features/github/presentation/viewmodels/github.viewmodel.dart';

final githubRepositoryProvider = Provider<IGithubRepository>((ref) {
  return MockGithubRepository();
});

final githubViewModelProvider = Provider((ref) {
  final githubRepository = ref.read(githubRepositoryProvider);
  return GithubViewModel(githubRepository);
});

final githubProvider = FutureProvider((ref) {
  final githubVM = ref.read(githubViewModelProvider);
  return githubVM.getLinkedData();
});
