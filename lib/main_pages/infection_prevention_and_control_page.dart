import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';
import 'package:infection/end_pages/infection_control/clostridium.dart';
import '../end_pages/infection_control/influenza.dart';
import '../end_pages/infection_control/public_health_notification.dart';
import '../end_pages/infection_control/sideroom_prioritisation.dart';
import 'opening_page.dart';

class InfectionControl extends StatelessWidget {
  InfectionControl({Key? key}) : super(key: key);

  final List<String> infectionControlTileTitles = [
    'Clostridioides difficile',
    'Influenza',
    'Middle East Respiratory Syndrome (MERS)',
    'Public Health Notification',
    'Sideroom Prioritisation'
  ];
  final List<Widget> infectionControlTileNavigation = [
    ICclostridium(),
    ICinfluenza(),
    OpeningPage(),
    ICpublicHealthNotification(),
    ICsideroomPrioritisation(),
  ];

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
