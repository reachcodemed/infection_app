import 'package:flutter/material.dart';
import 'package:infection/custom_widgets.dart';
import 'package:infection/constants.dart';

class RIebv extends StatefulWidget {
  @override
  _RIebvState createState() => _RIebvState();
}

class _RIebvState extends State<RIebv> {

  String antibioticTextOutput = '';
  int? ebvIgM = 0;
  int? ebvVCA= 0;
  int? cmvIgM = 0;
  int? ebvEBNA = 0;

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
      pageTitle: 'Epstein Barr Virus',
      antibioticTextOutput: antibioticTextOutput,
      toggleBox1: ToggleSwitchTriple(
          title: 'EBV IgM',
          indexPosition: ebvIgM,
          minWidth: minWidth,
          onValueChanged: (index)
          {
            setState(() {
              ebvIgM = index;
            });
          },
          switchColour: kHighlightedToggleYellow,
          firstText: 'Negative',
          secondText: 'Equivocal',
          thirdText: 'Positive'),
      toggleBox2: ToggleSwitchTriple(
          title: 'EBV VCA',
          indexPosition: ebvVCA,
          minWidth: minWidth,
          onValueChanged: (index)
          {
            setState(() {
              ebvVCA = index;
            });
          },
          switchColour: kHighlightedToggleYellow,
          firstText: 'Negative',
          secondText: 'Equivocal',
          thirdText: 'Positive'),
      toggleBox3: ToggleSwitchTriple(
          title: 'EBV EBNA',
          minWidth: minWidth,
          indexPosition: ebvEBNA,
          onValueChanged: (index)
          {
            setState(() {
              ebvEBNA = index;
            });
          },
          switchColour: kHighlightedToggleYellow,
          firstText: 'Negative',
          secondText: 'Equivocal',
          thirdText: 'Positive'),
      toggleBox4: CustomTextDoubleSwitch(
          title: 'CMV IgM',
          indexPosition: cmvIgM,
          onValueChanged: (index)
          {
            setState(() {
              cmvIgM = index;
            });
          },

          switchColour: kHighlightedToggleYellow,
          minWidth: (minWidth*1.67),
          firstText: 'Negative',
          secondText: 'Postive'),

    );
  }
}
