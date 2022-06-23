import 'package:flutter/material.dart';
import 'package:infection/custom_widgets.dart';
import 'package:infection/constants.dart';

class RIrubella extends StatefulWidget {
  @override
  _RIrubellaState createState() => _RIrubellaState();
}

class _RIrubellaState extends State<RIrubella> {

  String antibioticTextOutput = '';
  int? rubellaIgM = 0;
  int? rubellaIgG= 0;
  int? healthStatus = 0;

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
      pageTitle: 'Rubella',
      antibioticTextOutput: antibioticTextOutput,
      toggleBox1: ToggleSwitchTriple(
          title: 'Rubella IgM',
          indexPosition: rubellaIgM,
          minWidth: minWidth,
          onValueChanged: (index)
          {
            setState(() {
              rubellaIgM = index;
            });
          },
          switchColour: kHighlightedToggleYellow,
          firstText: 'Negative',
          secondText: 'Equivocal',
          thirdText: 'Positive'),
      toggleBox2: ToggleSwitchTriple(
          title: 'Rubella IgG',
          indexPosition: rubellaIgG,
          minWidth: minWidth,
          onValueChanged: (index)
          {
            setState(() {
              rubellaIgG = index;
            });
          },
          switchColour: kHighlightedToggleYellow,
          firstText: 'Negative',
          secondText: 'Equivocal',
          thirdText: 'Positive'),
      toggleBox3: QuadSwtichFullWidth(
          indexPosition: healthStatus,
          onValueChanged: (index)
          {
            setState(() {
              healthStatus = index;
            });
          },
          firstText: 'None',
          secondText: 'HIV',
          thirdText: 'Immune compromise',
          fourthText: 'Pregnant'),


    );
  }
}
