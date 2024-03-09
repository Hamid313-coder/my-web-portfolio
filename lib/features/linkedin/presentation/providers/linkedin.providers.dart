import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/features/linkedin/data/repositories/ilinkedin.repository.dart';
import 'package:my_portfolio/features/linkedin/data/repositories/linkedin.respository.dart';
import 'package:my_portfolio/features/linkedin/presentation/viewmodels/linkedin.viewmodel.dart';

final linkedInRepositoryProvider = Provider<ILinkedInRepository>((ref) {
  return LinkedInRepository(ref);
});

final linkedInViewModelProvider = Provider((ref) {
  final linkedInRepository = ref.read(linkedInRepositoryProvider);
  return LinkedInViewModel(linkedInRepository);
});

final linkedInProvider = FutureProvider((ref) {
  final linkedInVM = ref.read(linkedInViewModelProvider);
  return linkedInVM.getLinkedData();
});
