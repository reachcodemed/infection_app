import 'package:flutter/material.dart';
import 'package:infection/custom_widgets.dart';
import 'package:infection/constants.dart';

class RImumps extends StatefulWidget {
  @override
  _RImumpsState createState() => _RImumpsState();
}

class _RImumpsState extends State<RImumps> {

  String antibioticTextOutput = '';
  int? mumpsIgM = 0;
  int? mumpsIgG= 0;
  int? healthStatus = 0;

  double minWidth = 72.5;


  notifyParent()
  {
    setState(()
    {

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
      pageTitle: 'Mumps',
      antibioticTextOutput: antibioticTextOutput,
      toggleBox1: ToggleSwitchTriple(
          title: 'Mumps IgM',
          indexPosition: mumpsIgM,
          onValueChanged: (index)
          {
            setState(() {
              mumpsIgM = index;
            });
          },
          switchColour: kHighlightedToggleYellow,
          firstText: 'Negative',
          secondText: 'Equivocal',
          thirdText: 'Positive'),
      toggleBox2: ToggleSwitchTriple(
          title: 'Mumps IgG',
          indexPosition: mumpsIgG,
          onValueChanged: (index)
          {
            setState(() {
              mumpsIgG = index;
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
