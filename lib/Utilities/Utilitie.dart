import 'package:url_launcher/url_launcher.dart';

class Utilitie {
  void launchMailTo(String email, String subject) async {
    final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {'subject': subject},
    );
    String urlString = _emailLaunchUri.toString();
    if (await canLaunch(urlString)) {
      await launch(urlString);
    } else {
      print('MISY ERREUR EMAIL ENVOIE');
      throw 'Impossible d\'ouvrir $urlString';
    }
  }

  void urlLaunch(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('MISY ERREUR EMAIL ENVOIE');
      throw 'Impossible d\'ouvrir $url';
    }
  }
}
