import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class GPVaginalCandidiasis extends StatefulWidget {
  const GPVaginalCandidiasis({Key? key}) : super(key: key);

  @override
  _GPVaginalCandidiasisState createState() => _GPVaginalCandidiasisState();
}

class _GPVaginalCandidiasisState extends State<GPVaginalCandidiasis> {

  String antibioticTextOutput = "Select Options";
  int? isPregnant = 0;
  int? isRecurrent = 0;


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
    return ClassicEndPage(
      topPanelColour: kPrimaryCareOrange,
      pageTitle: "Vaginal Candidiasis",
      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        boxColour: kPaedsDropDownBlue,
        textInput: 'All topical and oral azoles give over 80% cure. Recurrent (>4 episodes per year): 150mg oral fluconazole every 72 hours for doses induction, follwed by 1 dose once a week for 6 months maintenance',
      ),

      toggleBox1: YesNoToggleBasic(
          title: '1. Patient Pregnant?',
          indexPosition: isPregnant,
          switchColour: kHighlightedToggleYellow,
          onValueChanged: (index)
        {
          setState(() {
            isPregnant = index;
          });
        },),


      toggleBox2: YesNoToggleBasic(
          title: '2. Recurrent (>4/year)',
          indexPosition: isRecurrent,
          switchColour: kHighlightedToggleYellow,
        onValueChanged: (index)
        {
          setState(() {
            isRecurrent = index;
          });
        },),
      
      


    );
  }
}
