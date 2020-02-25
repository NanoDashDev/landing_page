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
                height: MediaQuery.of(context).size.height / 1.42,
                width: MediaQuery.of(context).size.width / 2.42,
                bevel: 10.0,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SelectableText(
                        AppUi.content['welcome'],
                        style: Theme.of(context).textTheme.headline4,
                        textWidthBasis: TextWidthBasis.parent,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 62.0,
                      ),
                    ]
                      ..add(_buildText())
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

  Widget _buildText() {
    List<InlineSpan> content = <InlineSpan>[];
    int i = 0;
    for (String line in AppUi.content['lines']) {
      if (i == AppUi.content['lines'].length - 2) break;
      line.contains(RegExp('[?.:@]')) || line.contains('.fr')
          ? content.add(
              TextSpan(
                  text: line + '\r\n',
                  style: line.contains('.fr')
                      ? TextStyle(
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w900,
                        )
                      : null),
            )
          : content.add(TextSpan(text: line));
      i++;
    }
    content.add(
      TextSpan(
        text: '\r\n' + AppUi.content['lines'][i],
        style: TextStyle(
          color: Colors.blueGrey,
          fontWeight: FontWeight.w900,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
    content.add(TextSpan(
      text: AppUi.content['lines'][i + 1],
      style: TextStyle(color: Colors.white),
    ));
    return SelectableText.rich(
      TextSpan(
        style: TextStyle(color: Colors.white),
        children: content,
      ),
      textAlign: TextAlign.center,
      textWidthBasis: TextWidthBasis.parent,
    );
  }
}
