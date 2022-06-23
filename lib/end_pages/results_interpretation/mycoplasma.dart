import 'package:flutter/material.dart';
import 'package:infection/custom_widgets.dart';
import 'package:infection/constants.dart';

class RImycoplasma extends StatefulWidget {
  @override
  _RImycoplasmaState createState() => _RImycoplasmaState();
}

class _RImycoplasmaState extends State<RImycoplasma> {

  String antibioticTextOutput = '';
  int? mycoplasmaIgM = 0;

  double minWidth = 72.5;


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
          title: 'Mycoplasma IgM',
          indexPosition: mycoplasmaIgM,
          onValueChanged: (index)
          {
            setState(() {
              mycoplasmaIgM = index;
            });
          },
          switchColour: kHighlightedToggleYellow,
          firstText: 'Negative',
          secondText: 'Equivocal',
          thirdText: 'Positive'),
     


    );
  }
}
