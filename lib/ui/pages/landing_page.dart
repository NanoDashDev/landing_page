import 'package:flutter/material.dart';
import 'package:landing_page/services/locator.dart';

import 'package:landing_page/ui/app_ui.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LandingPage extends StatefulWidget {
  static final routeName = '/';

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (c, sizeInfo) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            body: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              primary: true,
              slivers: <Widget>[
                SliverAppBar(
                  title: Text(
                    AppUi.content['welcome'],
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontSize:
                              sizeInfo.screenSize.width < 450.0 ? 18.0 : 22.0,
                          color: Colors.white70,
                        ),
                    textWidthBasis: TextWidthBasis.parent,
                    textAlign: TextAlign.center,
                  ),
                  expandedHeight: MediaQuery.of(context).size.height * 0.08,
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.08,
                      ),
                      _buildText(
                          sizeInfo.screenSize.width < 450.0 ? 12.0 : 18.0),
                    ]..addAll(_buildFooter(
                        sizeInfo.screenSize.width < 450.0 ? 16.0 : 20.0)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildText(double fontSize) {
    List<InlineSpan> content = <InlineSpan>[];
    int i = 0;
    for (String line in AppUi.content['lines']) {
      if (i == AppUi.content['lines'].length - 2) break;
      line.contains(RegExp('[?.:@]')) || line.contains('.fr')
          ? content.add(
              TextSpan(
                  text: line + '\r\n',
                  style: line.contains('.fr')
                      ? Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w900,
                            fontSize: fontSize,
                          )
                      : null),
            )
          : content.add(TextSpan(text: line));
      i++;
    }
    content.add(
      TextSpan(
        text: '\r\n' + AppUi.content['lines'][i],
        style: Theme.of(context).textTheme.bodyText1.copyWith(
              color: Colors.blueGrey,
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic,
              fontSize: fontSize,
            ),
      ),
    );
    content.add(TextSpan(
      text: AppUi.content['lines'][i + 1],
      style: Theme.of(context).textTheme.bodyText1.copyWith(
            fontSize: fontSize,
          ),
    ));
    return SelectableText.rich(
      TextSpan(
        style: Theme.of(context).textTheme.bodyText1.copyWith(
              fontSize: fontSize,
            ),
        children: content,
      ),
      textAlign: TextAlign.center,
      textWidthBasis: TextWidthBasis.parent,
    );
  }

  List<Widget> _buildFooter(double fontSize) {
    return [
      SizedBox(
        height: 62.0,
      ),
      FloatingActionButton(
        onPressed: () => locator
            .get<AppUtils>()
            .launchUrl('mailto:contact@nanodash.fr?subject=Demande de contact'),
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
        child: RichText(
          text: TextSpan(
            text: '(Devis ',
            children: <InlineSpan>[
              TextSpan(
                text: 'gratuits',
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontSize: fontSize,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey,
                    ),
              ),
              TextSpan(
                text: ' !)\r\n',
              ),
            ],
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  fontSize: fontSize,
                  fontStyle: FontStyle.italic,
                ),
          ),
          overflow: TextOverflow.visible,
          softWrap: false,
        ),
      ),
      SizedBox(
        height: 24.0,
      ),
    ];
  }
}
