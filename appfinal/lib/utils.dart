import 'package:url_launcher/url_launcher.dart';

class Utils {
  static Future openLink({
    required String url,
  }) =>
      _launchUrl(url);
  static Future _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  static Future abrirEmail({
    required String toEmail,
    required String subject,
    required String body,
  }) async {
    final url =
        'mailto:$toEmail?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(body)}';
    await _launchUrl(url);
  }

  static Future llamarNumero({required String numeroCelular}) async {
    final url = 'tel:$numeroCelular';
    await _launchUrl(url);
  }
}
