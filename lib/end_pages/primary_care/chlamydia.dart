import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class GPChlamydia extends StatefulWidget {
  const GPChlamydia({Key? key}) : super(key: key);

  @override
  _GPChlamydiaState createState() => _GPChlamydiaState();
}

class _GPChlamydiaState extends State<GPChlamydia> {

  String antibioticTextOutput = "Select Options";
  int? isPenicillinAllergic = 0;
  int? isPregnant = 0;

  List<String> antibioticTextInput =
  [
    """First line: Azithromycin 1g PO STAT  

OR 

 Doxycycline 100mg BD

Duration: 7 days
""",
    """First line: Azithromycin 1g PO STAT  

OR 

 Doxycycline 100mg BD

Duration: 7 days
""",
    """First line: Azithromycin 1g PO STAT  

OR 

 Erythromycin 500mg BD/250mg QDS 

Duration: 7/14 days

OR

 Amoxicillin 500mg TDS 
Duration: 7 days 
""",
    """First line: Azithromycin 1g PO STAT  

OR 

 Erythromycin 500mg BD/250mg QDS 
 
 Duration: 7/14 days
""",
  ];

  notifyParent()
  {
   if (isPenicillinAllergic == 0)
     {
       if(isPregnant == 0 )
         {
           antibioticTextOutput = antibioticTextInput[0];
         }
       else
         {
           antibioticTextOutput = antibioticTextInput[2];
         }
     }
   else
     {
       if(isPregnant == 0 )
       {
         antibioticTextOutput = antibioticTextInput[1];
       }
       else
       {
         antibioticTextOutput = antibioticTextInput[3];
       }
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
      pageTitle: "Chlamydia",
      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        boxColour: kPaedsDropDownBlue,
        textInput: 'Opportunistically screen all patients aged 15 to 24 years. Treat partners and refer to GUM. Test positives for reinfection at 3 months. As lower cure rate in pregnancy, test for cure at least 3 weeks after end of treatment.',
      ),

      toggleBox1: YesNoToggleBasic(
          title: '1. Allergic to Penicillin?',
          switchColour: kHighlightedToggleYellow,
          indexPosition: isPenicillinAllergic,
        onValueChanged: (index)
        {
          setState(() {
            isPenicillinAllergic = index;
            notifyParent();
          });
        },),

      toggleBox2: YesNoToggleBasic(
          title: '2. Pregnant/Breastfeeding',
          indexPosition: isPregnant,
          switchColour: kHighlightedToggleYellow,
        onValueChanged: (index)
        {
          setState(() {
            isPregnant = index;
            notifyParent();
          });
        },),

    );
  }
}
