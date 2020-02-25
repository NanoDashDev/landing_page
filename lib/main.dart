import 'package:flutter/material.dart';
import 'package:landing_page/ui/pages/landing_page.dart';

void main() => runApp(NanoDashApp());

class NanoDashApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nanodash, votre partenaire digital',
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          backgroundColor: Colors.blueGrey.shade200,
          scaffoldBackgroundColor: Colors.blueGrey.shade200,
          dialogBackgroundColor: Colors.blueGrey.shade200,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            shape: CircleBorder(
              side: BorderSide(
                color: Colors.black,
                style: BorderStyle.solid,
                width: 0.5,
              ),
            ),
            backgroundColor: Colors.blueGrey,
          ),
          textTheme: TextTheme(headline4: TextStyle(color: Colors.blueGrey))),
      // initialRoute: LandingPage.routeName,
      // routes: {LandingPage.routeName: (context) => LandingPage()},
      home: LandingPage(),
    );
  }
}
