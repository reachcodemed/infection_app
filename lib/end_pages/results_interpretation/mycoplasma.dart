import 'package:flutter/material.dart';
import 'package:infection/custom_widgets.dart';
import 'package:infection/constants.dart';

class RImycoplasma extends StatefulWidget {
  @override
  _RImycoplasmaState createState() => _RImycoplasmaState();
}

class _RImycoplasmaState extends State<RImycoplasma> {
  String antibioticTextOutput = '';
  int? mycoplasmaIgM = 0;

  double minWidth = 72.5;

  notifyParent() {
    setState(() {
      mycoplasmaOutput();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notifyParent();
  }

  @override
  Widget build(BuildContext context) {
    return ResultsInterpretationEndPage(
      pageTitle: 'Mycoplasma',
      antibioticTextOutput: antibioticTextOutput,
      toggleBox1: CustomTextDoubleSwitch(
          title: 'Mycoplasma IgM',
          indexPosition: mycoplasmaIgM,
          minWidth: (minWidth * 1.3),
          onValueChanged: (index) {
            setState(() {
              mycoplasmaIgM = index;
              mycoplasmaOutput();
            });
          },
          switchColour: kHighlightedToggleYellow,
          firstText: 'Negative',
          secondText: 'Positive'),
    );
  }

  void mycoplasmaOutput() {
    if (mycoplasmaIgM == 0) {
      antibioticTextOutput =
          "No serological evidence of recent or current Mycoplasma infection";
    } else {
      antibioticTextOutput =
          "Serological evidence of recent or current Mycoplasma infection. Give a course of Clarithromycin or Doxycycline for 7 days";
    }
  }
}
