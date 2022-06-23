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
  int? havIgM= 0;

  double minWidth = 60;


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
      pageTitle: 'Hepatitis A',
      antibioticTextOutput: antibioticTextOutput,
      toggleBox1: ToggleSwitchTriple(
          title: 'HAV Total Antibody',
          minWidth: minWidth,
          indexPosition: havTotalAntibody,
          onValueChanged: (index)
          {
            setState(() {
              havTotalAntibody = index;
            });
          },
          switchColour: kHighlightedToggleYellow,
          firstText: 'Negative',
          secondText: 'Equivocal',
          thirdText: 'Positive'),
      toggleBox2: ToggleSwitchTriple(
          title: 'HAV IgM',
          indexPosition: havIgM,
          minWidth: minWidth,
          onValueChanged: (index)
          {
            setState(() {
              havIgM = index;
            });
          },
          switchColour: kHighlightedToggleYellow,
          firstText: 'Negative',
          secondText: 'Low Level',
          thirdText: 'Positive'),


    );
  }
}
