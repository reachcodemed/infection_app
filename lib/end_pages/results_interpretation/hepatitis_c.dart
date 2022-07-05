import 'package:flutter/material.dart';
import 'package:infection/custom_widgets.dart';
import 'package:infection/constants.dart';

class RIhepC extends StatefulWidget {
  @override
  _RIhepCState createState() => _RIhepCState();
}

class _RIhepCState extends State<RIhepC> {
  String antibioticTextOutput = '';
  int? hcvAb = 0;
  int? hcvRNA = 0;

  double minWidth = 70;

  notifyParent() {
    setState(() {
      hepcOutput();
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
      pageTitle: 'Hepatitis C',
      antibioticTextOutput: antibioticTextOutput,
      toggleBox1: CustomTextDoubleSwitch(
          title: 'HCV Antibody',
          indexPosition: hcvAb,
          minWidth: (minWidth * 1.45),
          onValueChanged: (index) {
            setState(() {
              hcvAb = index;
              hepcOutput();
            });
          },
          switchColour: kHighlightedToggleYellow,
          firstText: 'Negative',
          secondText: 'Positive'),
      toggleBox2: CustomTextDoubleSwitch(
          title: 'HCV RNA',
          indexPosition: hcvRNA,
          minWidth: (minWidth * 1.45),
          onValueChanged: (index) {
            setState(() {
              hcvRNA = index;
              hepcOutput();
            });
          },
          switchColour: kHighlightedToggleYellow,
          firstText: 'Undetected',
          secondText: 'Detected'),
    );
  }

  void hepcOutput() {
    if (hcvAb == 0) // HCV ANTIBODY NEGATIVE
    {
      if (hcvRNA == 0) // HCRNA NONE
      {
        antibioticTextOutput =
            "No serological evidence of previous or current HCV infection";
      } else // HCRNA DETECTED
      {
        antibioticTextOutput =
            "Possible early acute Hepatitis C infection. This result requires confirmation. Please send a further clotted blood sample and 2 x EDTA samples for repeat HCV RNA";
      }
    } else // HCV ANTIBODY POSITIVE
    {
      if (hcvRNA == 0) // HCRNA NONE
      {
        antibioticTextOutput =
            "This result is consistent with Hepatitis C infection. Please send 2 x EDTA bloods for Hepatitis C viral load to establish if this is past or current infection";
      } else // HCRNA DETECTED
      {
        antibioticTextOutput =
            "This result is consistent with active Hepatitis C infection. Please refer the patient to a Hepatologist";
      }
    }
  }
}
