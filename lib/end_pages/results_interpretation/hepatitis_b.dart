import 'package:flutter/material.dart';
import 'package:infection/custom_widgets.dart';
import 'package:infection/constants.dart';

class RIhepB extends StatefulWidget {
  @override
  _RIhepBState createState() => _RIhepBState();
}

class _RIhepBState extends State<RIhepB> {

  String antibioticTextOutput = '';
  int? hbsAg = 0;
  int? hbcAb= 0;
  int? hbsAb = 0;
  int? hbcIgM = 0;

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
      pageTitle: 'Hepatitis B',
      antibioticTextOutput: antibioticTextOutput,
      toggleBox1: CustomTextDoubleSwitch(
          title: 'Surface Antigen (HBsAg)',
          indexPosition: hbsAg,
          onValueChanged: (index)
        {
          setState(() {
            hbsAg = index;
          });
        },
          minWidth: minWidth,
          switchColour: kHighlightedToggleYellow,
          firstText: 'Negative',
          secondText: 'Positive',
          ),
      toggleBox2: CustomTextDoubleSwitch(
        title: 'Core Antibody (anti-HBc)',
        indexPosition: hbcAb,
        onValueChanged: (index)
        {
          setState(() {
            hbcAb = index;
          });
        },
        minWidth: minWidth,
        switchColour: kHighlightedToggleYellow,
        firstText: 'Negative',
        secondText: 'Positive',
      ),
      toggleBox3: CustomTextDoubleSwitch(
        title: 'Surface Antibody (anti-HBs)',
        indexPosition: hbsAb,
        onValueChanged: (index)
        {
          setState(() {
            hbsAb = index;

          });
        },
        minWidth: minWidth,
        switchColour: kHighlightedToggleYellow,
        firstText: 'Negative',
        secondText: 'Positive',
      ),
      toggleBox4: CustomTextDoubleSwitch(
        title: 'Core IgM (IgM anti-HBc)',
        indexPosition: hbcIgM,
        onValueChanged: (index)
        {
          setState(() {
            hbcIgM = index;
          });
        },
        minWidth: minWidth,
        switchColour: kHighlightedToggleYellow,
        firstText: 'Negative',
        secondText: 'Positive',
      ),

    );
  }
}
