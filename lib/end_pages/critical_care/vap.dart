import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';
import 'package:flutter/material.dart';

class ICUVAP extends StatefulWidget {
  @override
  _ICUVAPState createState() => _ICUVAPState();
}

class _ICUVAPState extends State<ICUVAP> {

  String antibioticTextOutput = "Here is the output";
  List<String>antibioticTextInput = [
    """ Piperacillin-Tazobactam 4.5g TDS IV

If history or high suspicion of MRSA, add Linezolid IV or PO 600mg BD

If recent Piperacillin-Tazobactam use, consider Meropenem 1g TDS IV
""",
    """ Meropenem 1g IV TDS

If history or high suspicion of MRSA, add Linezolid IV or PO 600mg BD

""",
    """ Ciprofloxacin 400mg BD IV
+ Linezolid IV or PO 600mg BD

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
        pageTitle: "Ventilator Associated Pneumonia",
        antibioticTextOutput: antibioticTextOutput);
  }
}
