import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';
import 'package:infection/end_pages/dosing_and_monitoring/amikacin.dart';
import 'package:infection/end_pages/dosing_and_monitoring/creatinine_clearance_calculator.dart';
import 'package:infection/end_pages/dosing_and_monitoring/gentamicin.dart';
import 'package:infection/end_pages/dosing_and_monitoring/height_weight_converter_page.dart';
import 'package:infection/end_pages/dosing_and_monitoring/other_antimicrobials.dart';
import 'package:infection/end_pages/dosing_and_monitoring/teicoplanin.dart';
import 'package:infection/end_pages/dosing_and_monitoring/vancomycin.dart';
import 'opening_page.dart';

class DosingMonitoring extends StatelessWidget {
  DosingMonitoring({Key? key}) : super(key: key);

  final List<String> dosingTileTitles = ['Amikacin', 'Gentamicin', 'Teicoplanin','Vancomycin','Creatinine Clearance Calculator','Other Antimicrobials','Height/Weight Converter',];

  final List<Widget> dosingTileNavigation= [Amikacin(),Gentamicin(),Teicoplanin(),Vancomycin(),CreatinineClearanceCalculator(),OtherAntimicrobials(),HeightAndWeightConverterPage(),];

  @override
  Widget build(BuildContext context) {
    return SubMenuModule(

      tileTitles: dosingTileTitles,
      tileNavigation: dosingTileNavigation,
      topBoxColour: kDosingGreen,
      topBoxText: 'Dosing & Monitoring',
    );

  }
}