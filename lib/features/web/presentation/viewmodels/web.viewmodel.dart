import 'package:my_portfolio/features/web/data/models/web_page.model.dart';
import 'package:my_portfolio/features/web/data/repositories/iweb.repository.dart';

class WebViewModel {
  final IWebRepository webRepository;
  WebViewModel(this.webRepository);

  Future<WebPageModel> getWebData() {
    return webRepository.getWebData();
  }
}
