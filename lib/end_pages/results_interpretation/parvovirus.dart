import 'package:flutter/material.dart';
import 'package:infection/custom_widgets.dart';
import 'package:infection/constants.dart';

class RIparvovirus extends StatefulWidget {
  @override
  _RIparvovirusState createState() => _RIparvovirusState();
}

class _RIparvovirusState extends State<RIparvovirus> {

  String antibioticTextOutput = '';
  int? parvovirusIgM = 0;
  int? parvovirusIgG= 0;
  int? pregnant = 0;

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
      pageTitle: 'Parvovirus',
      antibioticTextOutput: antibioticTextOutput,
      toggleBox1: ToggleSwitchTriple(
          title: 'Parvovirus IgM',
          indexPosition: parvovirusIgM,
          minWidth: minWidth,
          onValueChanged: (index)
          {
            setState(() {
              parvovirusIgM= index;
            });
          },
          switchColour: kHighlightedToggleYellow,
          firstText: 'Negative',
          secondText: 'Equivocal',
          thirdText: 'Positive'),
      toggleBox2: ToggleSwitchTriple(
          title: 'Parvovirus IgG',
          minWidth: minWidth,
          indexPosition: parvovirusIgG,
          onValueChanged: (index)
          {
            setState(() {
              parvovirusIgG = index;
            });
          },
          switchColour: kHighlightedToggleYellow,
          firstText: 'Negative',
          secondText: 'Equivocal',
          thirdText: 'Positive'),
      toggleBox3: CustomTextDoubleSwitch(
          title: 'Pregnant',
          indexPosition: pregnant,
          onValueChanged: (index)
          {
            setState(() {
              pregnant = index;
            });
          },
          switchColour: kHighlightedToggleYellow,
          minWidth: (minWidth*1.67),
          firstText: 'High',
          secondText: 'Low'),

    );
  }
}
