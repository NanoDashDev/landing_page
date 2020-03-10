import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class AppUi {
  static final Map<String, dynamic> content = {
    'welcome': 'Bienvenue sur NanoDash.fr !',
    'lines': [
      'Vous avez un projet digital à mener\r\n',
      'mais ne savez pas par où commencer ?\r\n',
      'Besoin de visibilité sur le web ou d\'une application ?\r\n',
      'Notre expert en développement multi-plateforme\r\n',
      'vous garantira une large audience.\r\n',
      'N\'hésitez plus et contactez-nous à l\'adresse :\r\n',
      'contact@nanodash.fr\r\n',
      'NanoDash.fr',
      ', partenaire de votre vie digitale.',
    ],
  };

  static List<Widget> get footer => [
        SizedBox(
          height: 62.0,
        ),
        FloatingActionButton(
          onPressed: () => _launchUrl(
              'mailto:contact@nanodash.fr?subject=Demande de contact'),
          tooltip:
              'Reach out at contact@nanodash.fr\nHire me with a simple mail request describing your project !',
          elevation: 0.0,
          disabledElevation: 0.0,
          focusElevation: 0.0,
          highlightElevation: 0.0,
          hoverElevation: 0.0,
          child: Icon(Icons.send),
        ),
        SizedBox(
          height: 8.0,
        ),
        Center(
          child: SelectableText.rich(
            TextSpan(
              text: '(Devis ',
              children: <InlineSpan>[
                TextSpan(
                  text: 'gratuits',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.blueGrey,
                  ),
                ),
                TextSpan(
                  text: ' !)\r\n',
                ),
              ],
            ),
            style: TextStyle(
              color: Colors.white,
              fontStyle: FontStyle.italic,
            ),
            textWidthBasis: TextWidthBasis.parent,
          ),
        ),
      ];
}

void _launchUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
