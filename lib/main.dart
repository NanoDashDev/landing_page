import 'package:flutter/material.dart';
import 'package:landing_page/ui/pages/landing_page.dart';

void main() => runApp(NanoDashApp());

class NanoDashApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LandingPage(title: 'NanoDash'),
    );
  }
}
