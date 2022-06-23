import 'package:flutter/material.dart';
import 'package:infection/custom_widgets.dart';
import 'package:infection/constants.dart';

class RIcmv extends StatefulWidget {
  @override
  _RIcmvState createState() => _RIcmvState();
}

class _RIcmvState extends State<RIcmv> {

  String antibioticTextOutput = '';
  int? cmvIgM = 0;
  int? cmvIgG= 0;
  int? cmvAvidity = 0;
  int? ebvIgM = 0;
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
      pageTitle: 'Cytomegalovirus (CMV)',
      antibioticTextOutput: antibioticTextOutput,
      toggleBox1: ToggleSwitchTriple(
          title: 'CMV IgM',
          indexPosition: cmvIgM,
          minWidth: minWidth,
          onValueChanged: (index)
          {
            setState(() {
              cmvIgM = index;
            });
          },
          switchColour: kHighlightedToggleYellow,
          firstText: 'Negative',
          secondText: 'Equivocal',
          thirdText: 'Positive'),
      toggleBox2: ToggleSwitchTriple(
          title: 'CMV IgG',
          indexPosition: cmvIgG,
          minWidth: minWidth,
          onValueChanged: (index)
          {
            setState(() {
              cmvIgG = index;
            });
          },

          switchColour: kHighlightedToggleYellow,
          firstText: 'Negative',
          secondText: 'Equivocal',
          thirdText: 'Positive'),
      toggleBox3: CustomTextDoubleSwitch(
          title: 'CMV Avidity',
          indexPosition: cmvAvidity,
          onValueChanged: (index)
          {
            setState(() {
              cmvAvidity = index;
            });
          },
          switchColour: kHighlightedToggleYellow,
          minWidth: (minWidth*1.65),
          firstText: 'High',
          secondText: 'Low'),
      toggleBox4: ToggleSwitchTriple(
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

    );
  }
}
