import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';
import 'package:infection/end_pages/covid/antimicrobial_guidance.dart';
import 'package:url_launcher/url_launcher.dart';
import 'opening_page.dart';

class Covid19 extends StatelessWidget
  {
  Covid19({Key? key}) : super(key: key);

  final List<String> covidTileTitles = ['Antimicrobial Guidance','Doffing', 'Donning','Ronapreve Criteria'];
  final List<Widget> covidTileNavigation= [
    CovidAntimicrobialGuidance(),
    const InstantWebPageOpen(webAddress: 'https://youtube.com/watch?v=oUo5O1JmLH0', returnToPage: OpeningPage(),),
    const InstantWebPageOpen(webAddress: 'https://youtube.com/watch?v=kKz_vNGsNhc',returnToPage: OpeningPage(),),
    OpeningPage()];

  @override
    Widget build(BuildContext context)
      {
          return SubMenuModule(
              tileTitles: covidTileTitles,
              tileNavigation: covidTileNavigation,
              topBoxColour: kCovidMaroon,
              topBoxText: 'Covid19',
          );

      }
  }

  //TODO: Currently the transition to these webpages is not good. Need to work on the navigation and improve this. Currently it is exiting out to the home page again which is not ideal.

class InstantWebPageOpen extends StatelessWidget {
  const InstantWebPageOpen({Key? key,
  required this.webAddress, required this.returnToPage

  }) : super(key: key);

  final String webAddress;
  final Widget returnToPage;

  @override
  Widget build(BuildContext context) {

    void webLauncher () async
    {
      String url = webAddress;

      if (await canLaunch(url))
      {
        await launch(url,
        );
      }

    }

    webLauncher();

    return returnToPage;
  }
}


