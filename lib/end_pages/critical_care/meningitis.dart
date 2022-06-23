import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';
import 'package:flutter/material.dart';

class ICUMeningitis extends StatefulWidget {
  @override
  _ICUMeningitisState createState() => _ICUMeningitisState();
}

class _ICUMeningitisState extends State<ICUMeningitis> {

  String antibioticTextOutput = "Here is the output";

  int? olderThan50 = 0;
  int? penicillinAllergic = 0;
  int? allergyType = null;

  List <String> antibioticTextInput =
  [
    """ CefTRIAXone 2g BD
        
If penicillin-resistant Streptococcus pneumoniae is suspected, or if a patient has recently returned from areas where this is prevalent (e.g. Spain, South East Asia, USA) then add: Vancomycin IV (see local dosing guide)
""",
    """CefTRIAXone 2g BD
                
Add Amoxicillin 2g IV 4-hrly
                
If penicillin-resistant Streptococcus pneumoniae is suspected, or if a patient has recently returned from areas where this is prevalent (e.g. Spain, South East Asia, USA) then add: Vancomycin IV (see local dosing guide)
""",
    """CefTRIAXone 2g BD
        
If penicillin-resistant Streptococcus pneumoniae is suspected, or if a patient has recently returned from areas where this is prevalent (e.g. Spain, South East Asia, USA) then add: Vancomycin IV (see local dosing guide)
""",
    """ Chloramphenicol 25mg/kg IV QDS, reduce dose to 1g QDS after 48 hours
                    
If penicillin-resistant Streptococcus pneumoniae is suspected, or if a patient has recently returned from areas where this is prevalent (e.g. Spain, South East Asia, USA) then add: Vancomycin IV (see local dosing guide)
""",
    """ CefTRIAXone 2g BD
                    
Add Co-trimoxazole 120mg/kg/day IV in 2-4 divided doses (not suitable in Sulphur allergy)
                    
If penicillin-resistant Streptococcus pneumoniae is suspected, or if a patient has recently returned from areas where this is prevalent (e.g. Spain, South East Asia, USA) then add: Vancomycin IV (see local dosing guide)
""",
    """ Chloramphenicol 25mg/kg IV QDS, reduce dose to 1g QDS after 48 hours
                
Add Co-trimoxazole 120mg/kg/day IV in 2-4 divided doses (not suitable in Sulphur allergy)
                
If penicillin-resistant Streptococcus pneumoniae is suspected, or if a patient has recently returned from areas where this is prevalent (e.g. Spain, South East Asia, USA) then add: Vancomycin IV (see local dosing guide)
""",
  ];




  notifyParent()
  {
    setState(() {
      if(olderThan50 == 0 && penicillinAllergic == 0)
      {
        antibioticTextOutput = antibioticTextInput [0];
      }
      else if (olderThan50 == 1 && penicillinAllergic == 0)
      {
        antibioticTextOutput = antibioticTextInput [1];
      }
      else if(olderThan50 == 0 && penicillinAllergic == 1 && allergyType == 1)
      {
        antibioticTextOutput = antibioticTextInput [2];
      }
      else if(olderThan50 == 0 && penicillinAllergic == 1 && allergyType == 0)
      {
        antibioticTextOutput = antibioticTextInput [3];
      }
      else if(olderThan50 == 1 && penicillinAllergic == 1 && allergyType == 1)
      {
        antibioticTextOutput = antibioticTextInput [4];
      }
      else if(olderThan50 == 1 && penicillinAllergic == 1 && allergyType == 0)
      {
        antibioticTextOutput = antibioticTextInput [5];
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
          textInput: "Take blood cultures and lumbar puncture if no contraindications. If lumbar puncture or blood culture delayed, first dose of antibiotics MUST be given.",
        ),

    toggleBox1: YesNoToggleBasic(
    switchColour: kHighlightedToggleLightPurple,
    title: '1. >50 years of age?',
    indexPosition: olderThan50,
    
    onValueChanged: (index) {
      setState(() {
        olderThan50 = index;
        penicillinAllergic == 1 ? allergyType = allergyType : allergyType =
        null;
      });
      notifyParent();
    },
    ),

        toggleBox2: YesNoToggleBasic(
          switchColour: kHighlightedToggleLightPurple,
          title: '2. Allergic to Penicillin?',
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
        pageTitle: "Meningitis",
        antibioticTextOutput: antibioticTextOutput);
  }
}
