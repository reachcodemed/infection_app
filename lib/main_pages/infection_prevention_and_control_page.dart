import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';
import 'opening_page.dart';

class InfectionControl extends StatelessWidget {
  InfectionControl({Key? key}) : super(key: key);

  final List<String> infectionControlTileTitles = ['Clostridioides difficile', 'Influenza','Middle East Respiratory Syndrome (MERS)','Sideroom Prioritisation'];
  final List<Widget> infectionControlTileNavigation= [OpeningPage(),OpeningPage(),OpeningPage(),OpeningPage()];

  @override
  Widget build(BuildContext context) {
    return SubMenuModule(
      tileTitles: infectionControlTileTitles,
      tileNavigation: infectionControlTileNavigation,
      topBoxColour: kInfectionControlBlue,
      topBoxText: 'Infection Control',
    );

  }
}