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
  int? hcvRNA= 0;


  double minWidth = 70;


  notifyParent()
  {
    setState(() {

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
      toggleBox1: ToggleSwitchTriple(
          title: 'HCV Antibody',
          indexPosition: hcvAb,
          minWidth: minWidth,
          onValueChanged: (index)
          {
            setState(() {
              hcvAb = index;
            });
          },
          switchColour: kHighlightedToggleYellow,
          firstText: 'Negative',
          secondText: 'Equivocal',
          thirdText: 'Positive'),
      toggleBox2: ToggleSwitchTriple(
          title: 'HCV RNA',
          indexPosition: hcvRNA,
          minWidth: minWidth,
          onValueChanged: (index)
          {
            setState(() {
              hcvRNA = index;
            });
          },
          switchColour: kHighlightedToggleYellow,
          firstText: 'None',
          secondText: 'Undetected',
          thirdText: 'Detected'),


    );
  }
}
