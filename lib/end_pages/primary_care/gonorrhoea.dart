import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class GPGonorrhoea extends StatefulWidget {
  const GPGonorrhoea({Key? key}) : super(key: key);

  @override
  _GPGonorrhoeaState createState() => _GPGonorrhoeaState();
}

class _GPGonorrhoeaState extends State<GPGonorrhoea> {

  String antibioticTextOutput = "Select Options";
  int? penicillinAllergic = 0;
  int? allergyType = 0;

  List <String> antibioticTextInput = [
    """IM CefTRIAXone 500mg STAT and PO Azithromycin 1g STAT""",
    """IM CefTRIAXone 500mg STAT and PO Azithromycin 1g STAT""",
    """Discuss with on-call GUM Consultant""",
  ];

  void notifyParent()
  {
   if(penicillinAllergic == 0)
     {
       antibioticTextOutput = antibioticTextInput[0];
     }
   else
     {
       if(allergyType == 0 )
         {
           antibioticTextOutput = antibioticTextInput[2];
         }
       else
         {
           antibioticTextOutput = antibioticTextInput[1];
         }
     }

  }


  @override
  Widget build(BuildContext context) {
    return ClassicEndPage(
      topPanelColour: kPrimaryCareOrange,
      pageTitle: "Gonorrhoea",
      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        boxColour: kPaedsDropDownBlue,
        textInput: 'Antibiotic resistance is now very high. Use IM Ceftriaxone and oral Azithromycin; refer to GUM. Test of cure is essential.',
      ),

      toggleBox1: YesNoToggleBasic(
        switchColour: kHighlightedToggleYellow,
        title: '1. Allergic to Penicillin?',
        indexPosition: penicillinAllergic,

        onValueChanged: (index)
        {

          setState(()
          {
            penicillinAllergic = index;
            penicillinAllergic == 1?allergyType = 0:allergyType = null;
            notifyParent();
          });

        },
      ),
      penicillinToggle: PenicillinSlider(
        boxColour: kPaedsDropDownBlue,
        switchColour: kHighlightedToggleYellow,
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
            notifyParent();
          });


        },
      ),


    );
  }
}
