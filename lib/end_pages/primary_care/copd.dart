import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class GPcopd extends StatefulWidget {
  const GPcopd({Key? key}) : super(key: key);

  @override
  _GPcopdState createState() => _GPcopdState();
}

class _GPcopdState extends State<GPcopd> {

  String antibioticTextOutput = "Select Options";
  int? isPenicillinAllergic = 0;
  int? isPregnant = 0;
  int? isHighRisk = 0;

  List <String> antibioticTextInput = [
    """ Doxycycline 200mg OD on the first day, then 100mg OD

OR 

 Amoxicillin 500mg TDS

Duration: 5 days
""",
    """ Doxycycline 200mg OD on the first day, then 100mg OD

OR 

 Clarithromycin 500mg BD

Duration: 5 days
""",
    """ Amoxicillin 500mg TDS

Duration: 5 days
""",
    """ Co-amoxiclav 625mg TDS

OR

 Co-trimoxazole 960mg BD

OR

 Levofloxacin 500mg OD

Duration: 5 days
""",
    """ Erythromycin 250-500mg QDS or 500-1000mg BD

Duration: 5 days 
""",
    """ Co-amoxiclav 625mg TDS

Duration: 5 days
""",
    """ Co-trimoxazole 960mg BD

OR

 Levofloxacin 500mg OD

Duration: 5 days
""",
    """ Erythromycin 250-500mg QDS or 500-1000mg BD

Duration: 5 days  
""",

  ];

  notifyParent()
  {
    if(isHighRisk == 0)
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
              antibioticTextOutput = antibioticTextInput[4];
            }
          }
      }
    else
      {
        if(isPregnant == 0)
        {
          if(isPenicillinAllergic == 0)
          {
            antibioticTextOutput = antibioticTextInput[3];
          }
          else
          {
            antibioticTextOutput = antibioticTextInput[6];
          }
        }
        else
        {
          if(isPenicillinAllergic == 0)
          {
            antibioticTextOutput = antibioticTextInput[5];
          }
          else
          {
            antibioticTextOutput = antibioticTextInput[7];
          }
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
      pageTitle: "Acute Exacerbation of COPD",
      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        boxColour: kPaedsDropDownBlue,
        height: 165,
        textInput: 'Many exacerbations are not caused by bacterial infections so will not respond to antibiotics. Consider an antibiotic, but only after taking into account the severity of the symptoms (particularly sputum colour changes and increases in volume or thickness), need for hospitalisations, previous exacerbations, hospitalisations and risk of complications, previous sputum culture and susceptibility results and risk of resistance with repeated courses.',
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
        },
      ),


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
        },),

      toggleBox3: YesNoToggleBasic(
          title: '3. Higher risk of treatment failure?',
          indexPosition: isHighRisk,
          switchColour: kHighlightedToggleYellow,
        onValueChanged: (index)
        {
          setState(() {
            isHighRisk = index;
            notifyParent();
          });
        },),


    );
  }
}
