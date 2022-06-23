import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class GPMastitis extends StatefulWidget {
  const GPMastitis({Key? key}) : super(key: key);

  @override
  _GPMastitisState createState() => _GPMastitisState();
}

class _GPMastitisState extends State<GPMastitis> {

  String antibioticTextOutput = "Select Options";
  int? isPenicillinAllergic = 0;



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
      pageTitle: "Mastitis",

      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        boxColour: kPaedsDropDownBlue,

        textInput: 'Suspect if woman has: painful breast; fever and/or general malaise; a tender, red breast. Breastfeeding: Oral antibiotics are approrpriate, where indicated. Advise to continue breast feeding if possible (including from affected breast)',
      ),

      toggleBox1: YesNoToggleBasic(
        title: '1. Allergic to Penicillin?',
        indexPosition: isPenicillinAllergic,
        switchColour: kHighlightedToggleYellow,
        onValueChanged: (index)
        {
          setState(() {
            isPenicillinAllergic = index;
          });
        },),


    );
  }
}
