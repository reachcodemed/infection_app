import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';
import 'package:flutter/material.dart';

class ICUHAP extends StatefulWidget {
  @override
  _ICUHAPState createState() => _ICUHAPState();
}

class _ICUHAPState extends State<ICUHAP> {

  String antibioticTextOutput = "Here is the output";
  List<String>antibioticTextInput = [
    """ Piperacillin-Tazobactam 4.5g TDS IV

If history or high suspicion of MRSA, add Vancomycin (continuous infusion)
""",
    """ CefTAZIDime 2g TDS IV

If history or high suspicion of MRSA, add Vancomycin (continuous infusion)
""",
    """ Ciprofloxacin 400mg BD IV

If history or high suspicion of MRSA, add Vancomycin (continuous infusion)
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
        pageTitle: "Hospital Acquired Pneumonia",
        antibioticTextOutput: antibioticTextOutput);
  }
}
