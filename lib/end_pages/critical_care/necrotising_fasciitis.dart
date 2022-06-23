import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';
import 'package:flutter/material.dart';

class ICUNecFasc extends StatefulWidget {
  @override
  _ICUNecFascState createState() => _ICUNecFascState();
}

class _ICUNecFascState extends State<ICUNecFasc> {

  int?penicillinAllergic = 0;

  String antibioticTextOutput = "Select Options";
  List <String> antibioticTextInput =
  [
    """ Piperacillin-Tazobactam 4.5g IV TDS
+ Clindamycin 1.2g IV QDS
+ Gentamicin IV (see trust dosing guidelines)
+ Teicoplanin IV (see trust dosing guidelines)

Review at 72 hours and discuss rationalisation with microbiology. Clindamycin must not be continued beyond 72 hours without microbiology advice.
""",
    """ Ciprofloxacin 400mg IV TDS
+ Clindamycin 1.2g IV QDS
+ Gentamicin IV (see trust dosing guidelines)
+ Teicoplanin IV (see trust dosing guidelines)

Review at 72 hours and discuss rationalisation with microbiology. Clindamycin must not be continued beyond 72 hours without microbiology advice. 
""",

  ];


  notifyParent()
  {
    setState(() {
      if(penicillinAllergic == 0)
      {
        antibioticTextOutput = antibioticTextInput[0];
      }
      else
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
        topRedBox: TopRedInfoBox(
          boxColour: kCriticalCareLightPurple,
          textInput: "•Urgent surgical review and debridement\n•Urgent gram stain on debrided tissue\n•Send blood culture\n•Consider giving IVIg\n•Discuss with Consultant Microbiologist urgently",
        ),
        toggleBox1: YesNoToggleBasic(
          switchColour: kHighlightedToggleLightPurple,
          title: '1. Allergic to Penicillin?',
          indexPosition: penicillinAllergic,
          
          onValueChanged: (index)
          {
            setState(()
            {
              penicillinAllergic = index;
            });
            notifyParent();
          },
        ),

        topPanelColour: kCriticalCareBlue,
        pageTitle: "Necrotising Fasciitis",
        antibioticTextOutput: antibioticTextOutput);
  }
}
