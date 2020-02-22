import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppUi {
  static final Map<String, dynamic> welcome = {
    'welcome': 'Bienvenue sur NanoDash.fr !',
    'lines': [
      'Vous avez un projet digital à mener',
      'mais ne savez pas par où commencer ?',
      'Besoin de visibilité sur le web ou d\'une application ?',
      'Notre expert en développement multi-plateforme',
      'vous garantira une large audience.',
      'N\'hésitez plus et contactez-nous à l\'adresse :',
      'contact@nanodash.fr',
      '(Devis gratuits !)'
    ],
    'footer': [
      'NanoDash.fr',
      ', partenaire de votre vie digitale.',
    ]
  };

  static List<Widget> get footer => [
        SizedBox(
          height: 62.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SelectableText(
              AppUi.welcome['footer'][0],
              style: TextStyle(
                color: Colors.blueGrey,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w900,
              ),
              textWidthBasis: TextWidthBasis.parent,
            ),
            SelectableText(
              AppUi.welcome['footer'][1],
              style: TextStyle(
                color: Colors.white,
              ),
              textWidthBasis: TextWidthBasis.parent,
            ),
          ],
        ),
        SizedBox(
          height: 25.0,
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
      ];
}

void _launchUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
