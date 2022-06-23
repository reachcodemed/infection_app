import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/custom_widgets.dart';

class Meningitis extends StatefulWidget {
  @override
  _MeningitisState createState() => _MeningitisState();
}

class _MeningitisState extends State<Meningitis> {


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

  String antibioticTextOutput = "Select Options";


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
        pageTitle: "Meningitis",
        antibioticTextOutput: antibioticTextOutput,
        topRedBox: TopRedInfoBox(textInput:
          'Take blood cultures and lumbar puncture if no contraindications. If lumbar puncture or blood culture delayed, first dose of antibiotics MUST be given.'
        ),
      toggleBox1: YesNoToggleBasic(
        title: '1. >50 years of age?',
        indexPosition: olderThan50,
        
        onValueChanged: (index)
        {

          setState(()
          {
            olderThan50 = index;

          });

          notifyParent();

        },
      ),

      toggleBox2: YesNoToggleBasic(
        title: '2. Allergic to Pencillin',
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
    );
  }
}
