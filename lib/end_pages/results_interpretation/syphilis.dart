import 'package:flutter/material.dart';
import 'package:infection/custom_widgets.dart';
import 'package:infection/constants.dart';

class RIsyphilis extends StatefulWidget {
  @override
  _RIsyphilisState createState() => _RIsyphilisState();
}

class _RIsyphilisState extends State<RIsyphilis> {

  String antibioticTextOutput = '';
  int? screenAb = 0;
  int? secondAb = 0;
  int? tppa = 0;
  int? igM = 0;
  int? rpr = 0;
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
      pageTitle: 'Syphilis',
      antibioticTextOutput: antibioticTextOutput,
      toggleBox1: CustomTextDoubleSwitch(
          title: 'Screen Antibody',
          indexPosition: screenAb,
          onValueChanged: (index)
          {
            setState(() {
              screenAb = index;
            });
          },
          minWidth: minWidth*1.65,
          switchColour: kHighlightedToggleYellow,
          firstText: 'Negative',
          secondText: 'Positive'),
      toggleBox2: CustomTextDoubleSwitch(
          title: 'Second Antibody',
          indexPosition: secondAb,
          onValueChanged: (index)
          {
            setState(() {
              secondAb = index;
            });
          },
          switchColour: kHighlightedToggleYellow,
          minWidth: minWidth*1.65,
          firstText: 'Negative',
          secondText: 'Positive'),
      toggleBox3: CustomTextDoubleSwitch(
          title: 'TPPA',
          indexPosition: tppa,
          onValueChanged: (index)
          {
            setState(() {
              tppa = index;
            });
          },
          minWidth: minWidth*1.65,
          switchColour: kHighlightedToggleYellow,
          firstText: 'Negative',
          secondText: 'Positive'),
      toggleBox4: CustomTextDoubleSwitch(
          title: 'IgM',
          indexPosition: igM,
          onValueChanged: (index)
          {
            setState(() {
              igM = index;
            });
          },
          switchColour: kHighlightedToggleYellow,
          minWidth: minWidth*1.65,
          firstText: 'Negative',
          secondText: 'Positive'),
      toggleBox5: ToggleSwitchTriple(
        title: 'RPR',
        minWidth: minWidth,
        indexPosition: rpr,
        switchColour: kHighlightedToggleYellow,
        onValueChanged: (index)
        {
          setState(() {
            rpr = index;
          });
        },
        firstText: 'Negative',
        secondText: '< 16',
        thirdText: '> 16',),




    );
  }
}
