import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class GPSoreThroat extends StatefulWidget {
  const GPSoreThroat({Key? key}) : super(key: key);

  @override
  _GPSoreThroatState createState() => _GPSoreThroatState();
}

class _GPSoreThroatState extends State<GPSoreThroat> {

  String antibioticTextOutput = "Select Options";
  int? isPenicillinAllergic = 0;
  int? isPregnant = 0;


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
      pageTitle: "Acute Sore Throat",
      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        boxColour: kPaedsDropDownBlue,
        textInput: 'Consider hospital admission for: suspected epiglottitis, breathing difficulty, clinical dehydration, peri-tonsillar abscess kor cellulitis, parapharyngeal abscess, retropharyngeal asbcess, or Lemierre syndrome',
      ),

      toggleBox1: YesNoToggleBasic(
        title: '1. Allergic to penicillin?',
        indexPosition: isPenicillinAllergic,
        switchColour: kHighlightedToggleYellow,
        onValueChanged: (index)
        {
          setState(() {
            isPenicillinAllergic = index;
          });
        },),


      toggleBox2: YesNoToggleBasic(
          title: '2. Pregnant?',
          indexPosition: isPregnant,
          switchColour: kHighlightedToggleYellow,
          onValueChanged: (index)
          {
            setState(() {
              isPregnant = index;
            });
          }),

    );
  }
}
