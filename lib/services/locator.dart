import 'package:get_it/get_it.dart';
import 'package:url_launcher/url_launcher.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<AppUtils>(() => AppUtilsImplementation());
}

abstract class AppUtils {
  void launchUrl(String url);
}

class AppUtilsImplementation implements AppUtils {
  @override
  void launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
