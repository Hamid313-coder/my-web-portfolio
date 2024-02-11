import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/features/twitter/data/repositories/itwitter.repository.dart';
import 'package:my_portfolio/features/twitter/data/repositories/mock_twitter.repository.dart';
import 'package:my_portfolio/features/twitter/presentation/viewmodels/twitter.viewmodel.dart';

final twitterRepositoryProvider = Provider<ITwitterRepository>((ref) {
  return MockTwitterRepository();
});

final twitterViewModelProvider = Provider<TwitterViewModel>((ref) {
  final twitterRepository = ref.read(twitterRepositoryProvider);
  return TwitterViewModel(twitterRepository);
});

final twitterProvider = FutureProvider((ref) {
  final twitterVM = ref.read(twitterViewModelProvider);
  return twitterVM.getTwitterData();
});
