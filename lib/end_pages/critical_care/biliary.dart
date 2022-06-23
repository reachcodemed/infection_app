import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';
import 'package:flutter/material.dart';

class ICUBiliarySepsis extends StatefulWidget {
  @override
  _ICUBiliarySepsisState createState() => _ICUBiliarySepsisState();
}

class _ICUBiliarySepsisState extends State<ICUBiliarySepsis> {

  String antibioticTextOutput = "Here is the output";

  List<String>antibioticTextInput = [
    """ Piperacillin-Tazobactam 4.5g TDS IV
+ Amikacin IV (as per clinical guidelines)

If prosthetic material present, recent surgical intervention OR history of ESBL producing organisms then use Meropenem 1g TDS empirically
""",
    """ CefTRIAXone 2g OD IV
+ Amikacin IV (dosing as per guidelines)
± Metronidazole 500mg TDS IV

If prosthetic material present, recent surgical intervention OR history of ESBL producing organisms then use Meropenem 1g TDS empirically
""",
    """ Ciprofloxacin 400mg BD IV
+ Amikacin IV (dosing as per guidelines)
+ Metronidazole 500mg TDS IV
+ Vancomycin IV (continuous infusion)

""",
  ];

  int? penicillinAllergic = 0;
  int? allergyType = null;

  notifyParent()
  {
    setState(() {
      if(penicillinAllergic == 0)
      {
        antibioticTextOutput = antibioticTextInput[0];
      }
      else if(penicillinAllergic ==1 && allergyType ==1)
      {
        antibioticTextOutput = antibioticTextInput[1];
      }
      else if(penicillinAllergic == 1 && allergyType ==0)
      {
        antibioticTextOutput = antibioticTextInput[2];
      }

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
        toggleBox1: YesNoToggleBasic(
          switchColour: kHighlightedToggleLightPurple,
          title: '1. Allergic to Penicillin?',
          indexPosition: penicillinAllergic,
          
          onValueChanged: (index)
          {
            setState(()
            {
              penicillinAllergic = index;
              penicillinAllergic == 1?allergyType = 0:allergyType = null;
            });
            notifyParent();
          },
        ),
        penicillinToggle: PenicillinSlider(
          boxColour: kCriticalCareLightPurple,
          switchColour: kHighlightedToggleLightPurple,
          indexPosition: allergyType,
          onValueChanged: (index)
          {
            setState(() {
              if (penicillinAllergic == 1)
              {
                allergyType = index;
              }
              else
              {
                allergyType = null;
              }
            });
            notifyParent();
          },
        ),

        topPanelColour: kCriticalCareBlue,
        pageTitle: "Biliary Sepsis",
        antibioticTextOutput: antibioticTextOutput);
  }
}
