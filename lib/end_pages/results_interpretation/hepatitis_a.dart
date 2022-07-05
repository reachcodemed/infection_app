import 'package:flutter/material.dart';
import 'package:infection/custom_widgets.dart';
import 'package:infection/constants.dart';

class RIhepA extends StatefulWidget {
  @override
  _RIhepAState createState() => _RIhepAState();
}

class _RIhepAState extends State<RIhepA> {
  String antibioticTextOutput = '';
  int? havTotalAntibody = 0;
  int? havIgM = 0;

  double minWidth = 60;

  notifyParent() {
    setState(() {
      hepaOutput();
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
      pageTitle: 'Hepatitis A',
      antibioticTextOutput: antibioticTextOutput,
      toggleBox1: CustomTextDoubleSwitch(
          title: 'HAV Total Antibody',
          minWidth: (minWidth * 1.45),
          indexPosition: havTotalAntibody,
          onValueChanged: (index) {
            setState(() {
              havTotalAntibody = index;
              hepaOutput();
            });
          },
          switchColour: kHighlightedToggleYellow,
          firstText: 'Negative',
          secondText: 'Positive'),
      toggleBox2: CustomTextDoubleSwitch(
          title: 'HAV IgM',
          indexPosition: havIgM,
          minWidth: (minWidth * 1.45),
          onValueChanged: (index) {
            setState(() {
              havIgM = index;
              hepaOutput();
            });
          },
          switchColour: kHighlightedToggleYellow,
          firstText: 'Negative',
          secondText: 'Positive'),
    );
  }

  void hepaOutput() {
    setState(() {
      if (havTotalAntibody == 0) // HAV TOTAL NEGATIVE
      {
        if (havIgM == 0) // HAIGM NEGATIVE
        {
          antibioticTextOutput =
              "No evidence of previous Hepatitis A immunisation or infection";
        } else // HAIGM POSITIVE
        {
          antibioticTextOutput =
              "Evidence of early acute hepatitis A infection or non-specific IgM. Please send a repeat clotted blood sample to confirm";
        }
      } else // HAV TOTAL POSITIVE
      {
        if (havIgM == 0) // HAIGM NEGATIVE
        {
          antibioticTextOutput =
              "Consistent with previous hepatitis A immunisation or past infection";
        } else // HAIGM POSITIVE
        {
          antibioticTextOutput =
              "Evidence of acute hepatitis A infection. Please send a repeat clotted blood sample to confirm and advise to notify the local Health Protection Team of this new diagnosis";
        }
      }
    });
  }
}
