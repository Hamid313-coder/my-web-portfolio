import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_portfolio/features/github/presentation/providers/github.providers.dart';
import 'package:my_portfolio/features/linkedin/presentation/providers/linkedin.providers.dart';
import 'package:my_portfolio/features/twitter/presentation/providers/twitter.providers.dart';
import 'package:my_portfolio/features/web/presentation/providers/web.providers.dart';
import 'package:my_portfolio/features/welcome/presentation/providers/welcom_page.providers.dart';

class SplashPageViewModel {
  final Ref ref;

  SplashPageViewModel(this.ref);

  Future<bool> preloadPages() {
    Completer<bool> preloadCompleter = Completer();

    Future.wait([
      ref.read(welcomeProvider.future),
      ref.read(twitterProvider.future),
      ref.read(linkedInProvider.future),
      ref.read(githubProvider.future),
      ref.read(webProvider.future),
    ]).then((value) {
      preloadCompleter.complete(true);
    }).catchError((error) {
      preloadCompleter.completeError(error);
    }).onError((error, stackTrace) {
      preloadCompleter.completeError(error!);
    });

    return preloadCompleter.future;
  }
}
