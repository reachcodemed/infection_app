import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class GPBronchitis extends StatefulWidget {
  const GPBronchitis({Key? key}) : super(key: key);

  @override
  _GPBronchitisState createState() => _GPBronchitisState();
}

class _GPBronchitisState extends State<GPBronchitis> {

  String antibioticTextOutput = "Select Options";
  int? isPenicillinAllergic = 0;
  int? isPregnant = 0;

  List<String> antibioticTextInput = [
    """Adult: Doxycycline 200mg day 1 then 100mg OD

Children: Not for use in <12 years of age

Duration: 5 days

OR

Adult: Amoxicillin 500mg TDS 

Children: please refer to BNFC

Duration: 5 days
""",
    """Adult: Clarithromycin 250-500mg BD

Children: Please refer to BNFC

Duration: 5 days
""",
    """Adult: Amoxicillin 500mg TDS 

Duration: 5 days
""",
    """Adult: Erythromycin 250-500mg QDS or 500-1000mg BD

Duration: 5 days

"""
  ];

  void notifyParent()
  {
    if(isPregnant == 0)
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
    else
      {
        if(isPenicillinAllergic == 0)
          {
            antibioticTextOutput = antibioticTextInput[2];
          }
        else
          {
            antibioticTextOutput = antibioticTextInput[3];
          }
      }
  }

  @override
  Widget build(BuildContext context) {
    return ClassicEndPage(
      topPanelColour: kPrimaryCareOrange,
      pageTitle: "Acute Cough, Bronchitis",
      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        boxColour: kPaedsDropDownBlue,
        textInput: 'Antibiotics of little benefit if no comorbidity. No antibiotic: self-care and antibiotic advice. 7 days delayed antibiotic: safety net and advise symptoms can last 3 weeks',
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


      toggleBox2: YesNoToggleBasic(
          title: '2. Patient Pregnant?',
          indexPosition: isPregnant,
          switchColour: kHighlightedToggleYellow,
          onValueChanged: (index)
        {
          setState(() {
            isPregnant = index;
            notifyParent();
          });
        },
      ),



    );
  }
}
