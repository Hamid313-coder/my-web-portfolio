import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/features/web/data/repositories/iweb.repository.dart';
import 'package:my_portfolio/features/web/data/repositories/mock_web.repository.dart';
import 'package:my_portfolio/features/web/presentation/viewmodels/web.viewmodel.dart';

final webRepositoryProvider = Provider<IWebRepository>((ref) {
  return MockWebRepository();
});

final webViewModelProvider = Provider((ref) {
  final webRepository = ref.read(webRepositoryProvider);
  return WebViewModel(webRepository);
});

final webProvider = FutureProvider((ref) {
  final webVM = ref.read(webViewModelProvider);
  return webVM.getWebData();
});
