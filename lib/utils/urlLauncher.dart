import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  openURL(url) async {
    url = Uri.parse(url);

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      print("Error");
    }
  }
}
