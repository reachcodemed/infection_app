import 'package:flutter/material.dart';
import 'package:infection/custom_widgets.dart';
import 'package:infection/constants.dart';

class RIcsf extends StatefulWidget {
  @override
  _RIcsfState createState() => _RIcsfState();
}

class _RIcsfState extends State<RIcsf> {

  String antibioticTextOutput = '';
  int? isAbxBeforeLP = 0;
  int? isWCCRaised = 0;
  int? differential = 0;
  int? protein = 0;
  int? glucose = 0;
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
        pageTitle: 'Cerebrospinal Fluid (CSF)',
        antibioticTextOutput: antibioticTextOutput,
        toggleBox1: CustomTextDoubleSwitch(
            title: 'Antibiotics given before LP',
            indexPosition: isAbxBeforeLP,
            onValueChanged: (index)
            {
              setState(() {
                isAbxBeforeLP = index;
              });
            },
            minWidth: minWidth,
            switchColour: kHighlightedToggleYellow,
            firstText: 'No',
            secondText: 'Yes'),
      toggleBox2: CustomTextDoubleSwitch(
          title: 'White Cell Count',
          indexPosition: isWCCRaised,
          onValueChanged: (index)
          {
            setState(() {
              isWCCRaised = index;
            });
          },
          switchColour: kHighlightedToggleYellow,
          minWidth: minWidth,
          firstText: '<5',
          secondText: '5-1000+'),
      toggleBox3: CustomTextDoubleSwitch(
          title: 'Differential',
          indexPosition: differential,
          onValueChanged: (index)
          {
            setState(() {
              differential = index;
            });
          },
          switchColour: kHighlightedToggleYellow,
          minWidth: (minWidth*1.65),
          firstText: 'Neutrophils',
          secondText: 'Lymphocytes'),
      toggleBox4: ToggleSwitchTriple(
          title: 'Protein',
          indexPosition: protein,
          minWidth: minWidth,
          switchColour: kHighlightedToggleYellow,

        onValueChanged: (index)
        {
          setState(() {
            protein = index;
          });
        },
          buttonSpecificFontSize2: 22,
          buttonSpecificFontSize3: 22,
          firstText: 'Normal',
          secondText: '↑',
          thirdText: '↑↑',),
      toggleBox5: ToggleSwitchTriple(
          title: 'Glucose',
          indexPosition: glucose,
          switchColour: kHighlightedToggleYellow,
          minWidth: minWidth,
          onValueChanged: (index)
          {
            setState(() {
              glucose = index;
            });
          },
          buttonSpecificFontSize1: 22,
          buttonSpecificFontSize2: 22,
          firstText: '↓↓',
          secondText: '↓',
          thirdText: '2.6 - 4.5',),



      );
  }
}
