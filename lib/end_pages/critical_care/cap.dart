import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';
import 'package:flutter/material.dart';

class ICUCAP extends StatefulWidget {
  @override
  _ICUCAPState createState() => _ICUCAPState();
}

class _ICUCAPState extends State<ICUCAP> {

  String antibioticTextOutput = "Here is the output";

  List <String> antibioticTextInput = [
    """ CefTRIAXone 2g OD IV
+ Doxycycline 200mg OD PO

If PO route not available Clarithromycin 500mg BD IV
""",
    """ Levofloxacin 500mg OD PO

If PO route not available Levofloxacin 500mg OD IV
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
        pageTitle: "Community Acquired Pneumonia",
        antibioticTextOutput: antibioticTextOutput);
  }
}
