import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';
import 'package:flutter/material.dart';

class ICULongLine extends StatefulWidget {
  @override
  _ICULongLineState createState() => _ICULongLineState();
}

class _ICULongLineState extends State<ICULongLine> {

  String antibioticTextOutput = """ Vancomycin IV(through the line if not removed) continuous infusion. Discuss with microbiology as early as possible""";

  @override
  Widget build(BuildContext context) {
    return ClassicEndPage(
        topPanelColour: kCriticalCareBlue,
        pageTitle: "Long Line Infections",
        antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        boxColour: kCriticalCareLightPurple,
        textInput: "If the line is not essential to therapy, please consider primary removal. Antibiotics may not be required if the patient is well after removal. Please ensure blood cultures are taken from the LINE AND PERIPHERALLY and labelled appropriately.",
      ),);


  }
}
