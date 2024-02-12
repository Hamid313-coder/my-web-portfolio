import 'package:my_portfolio/features/linkedin/data/models/linkedin_page.model.dart';

abstract class ILinkedInRepository {
  Future<LinkedInPageModel> getLinkedInData();
}
