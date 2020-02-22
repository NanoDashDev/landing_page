import 'package:flutter/material.dart';
import 'package:landing_page/ui/app_ui.dart';
import 'package:landing_page/ui/widgets/neumorphic_container.dart';

class LandingPage extends StatefulWidget {
  static final routeName = '/';

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Stack(
          children: <Widget>[
            Center(
              child: NeumorphicButton(
                height: /* MediaQuery.of(context).size.height / 1.6 */ 550.0,
                width: /* MediaQuery.of(context).size.width / 3 */ 650.0,
                bevel: 10.0,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SelectableText(
                        AppUi.welcome['welcome'],
                        style: Theme.of(context).textTheme.headline4.copyWith(
                              color: Colors.blueGrey,
                            ),
                        textWidthBasis: TextWidthBasis.parent,
                      ),
                      SizedBox(
                        height: 62.0,
                      ),
                    ]
                      ..addAll(_buildText())
                      ..addAll(AppUi.footer),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildText() => [
        SelectableText(
          AppUi.welcome['lines'][0],
          style: TextStyle(
            color: Colors.white,
          ),
          textWidthBasis: TextWidthBasis.parent,
        ),
        SelectableText(
          AppUi.welcome['lines'][1],
          style: TextStyle(
            color: Colors.white,
          ),
          textWidthBasis: TextWidthBasis.parent,
        ),
        SizedBox(
          height: 12.0,
        ),
        SelectableText(
          AppUi.welcome['lines'][2],
          style: TextStyle(
            color: Colors.white,
          ),
          textWidthBasis: TextWidthBasis.parent,
        ),
        SizedBox(
          height: 12.0,
        ),
        SelectableText(
          AppUi.welcome['lines'][3],
          style: TextStyle(
            color: Colors.white,
          ),
          textWidthBasis: TextWidthBasis.parent,
        ),
        SelectableText(
          AppUi.welcome['lines'][4],
          style: TextStyle(
            color: Colors.white,
          ),
          textWidthBasis: TextWidthBasis.parent,
        ),
        SizedBox(
          height: 12.0,
        ),
        SelectableText(
          AppUi.welcome['lines'][5],
          style: TextStyle(
            color: Colors.white,
          ),
          textWidthBasis: TextWidthBasis.parent,
        ),
        SizedBox(
          height: 4.0,
        ),
        SelectableText(
          AppUi.welcome['lines'][6],
          style: TextStyle(
            color: Colors.blueGrey,
            fontWeight: FontWeight.w900,
          ),
          textWidthBasis: TextWidthBasis.parent,
        ),
        SizedBox(
          height: 12.0,
        ),
        SelectableText(
          AppUi.welcome['lines'][7],
          style: TextStyle(
            color: Colors.white,
          ),
          textWidthBasis: TextWidthBasis.parent,
        ),
      ];
}
