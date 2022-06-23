import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class GPLymeDisease extends StatefulWidget {
  const GPLymeDisease({Key? key}) : super(key: key);

  @override
  _GPLymeDiseaseState createState() => _GPLymeDiseaseState();
}

class _GPLymeDiseaseState extends State<GPLymeDisease> {

  String antibioticTextOutput = "Select Options";
  int? isPenicillinAllergic = 0;


  List<String> antibioticTextInput = [
    """Prophylaxis:

Adult: Doxycycline 200mg STAT

Children: please refer to BNFC

Treatment: 

Adult: First line: Doxycycline 100mg BD or 200mg OD
Children: First line: Amoxicillin - please refer to BNFC for dosing

Alternative: Adult: Amoxicillin 1g TDS
Children: Please refer to BNFC

Duration: 21 days

""",
    """Prophylaxis:

Adult: Doxycycline 200mg STAT

Children: please refer to BNFC

Treatment: 

Adult: First line: Doxycycline 100mg BD or 200mg OD
Children: Please discuss with Consultant Microbiologist

Duration: 21 days

""",
  ];


  notifyParent()
  {
    if(isPenicillinAllergic == 0)
    {
      antibioticTextOutput = antibioticTextInput[0];
    }
    else
    {
      antibioticTextOutput = antibioticTextInput[1];
    }
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
      pageTitle: "Lyme Disease",

      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        boxColour: kPaedsDropDownBlue,
        height: 120,
        textInput: 'Treatment: Treat erythema migrans empirically; serology is often negative early in infection. For other suspected Lyme disease such as neuroborreliosis (CN palsy, radiculopathy) see advice.',
      ),

      toggleBox1: YesNoToggleBasic(
        title: '1. Allergic to Penicillin?',
        indexPosition: isPenicillinAllergic,
        switchColour: kHighlightedToggleYellow,
        onValueChanged: (index)
        {
          setState(() {
            isPenicillinAllergic = index;
            notifyParent();
          });
        },),

    );
  }
}
