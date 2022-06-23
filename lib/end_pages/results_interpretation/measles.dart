import 'package:flutter/material.dart';
import 'package:infection/custom_widgets.dart';
import 'package:infection/constants.dart';

class RImeasles extends StatefulWidget {
  @override
  _RImeaslesState createState() => _RImeaslesState();
}

class _RImeaslesState extends State<RImeasles> {

  String antibioticTextOutput = '';
  int? measlesIgM = 0;
  int? measlesIgG= 0;
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
      pageTitle: 'Measles',
      antibioticTextOutput: antibioticTextOutput,
      toggleBox1: ToggleSwitchTriple(
          title: 'Measles IgM',
          indexPosition: measlesIgM,
          minWidth: minWidth,
          onValueChanged: (index)
          {
            setState(() {
              measlesIgM = index;
            });
          },
          switchColour: kHighlightedToggleYellow,
          firstText: 'Negative',
          secondText: 'Equivocal',
          thirdText: 'Positive'),
      toggleBox2: ToggleSwitchTriple(
          title: 'Measles IgG',
          indexPosition: measlesIgG,
          minWidth: minWidth,
          onValueChanged: (index)
          {
            setState(() {
              measlesIgG = index;
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
