import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';
import 'package:flutter/material.dart';

class ICUIntraAbdominalSepsis extends StatefulWidget {
  @override
  _ICUIntraAbdominalSepsisState createState() => _ICUIntraAbdominalSepsisState();
}

class _ICUIntraAbdominalSepsisState extends State<ICUIntraAbdominalSepsis> {

  String antibioticTextOutput = "Here is the output";

  List<String>antibioticTextInput = [
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
        antibioticTextOutput = antibioticTextInput[0];
      }
      else if(penicillinAllergic == 1 && allergyType ==0)
      {
        antibioticTextOutput = antibioticTextInput[1];
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
        pageTitle: "Intra Abdominal Sepsis",
        antibioticTextOutput: antibioticTextOutput);
  }
}
