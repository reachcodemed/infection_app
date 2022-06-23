import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/custom_widgets.dart';

class VaricealBleed extends StatefulWidget {
  const VaricealBleed({Key? key}) : super(key: key);

  @override
  _VaricealBleedState createState() => _VaricealBleedState();
}

class _VaricealBleedState extends State<VaricealBleed> {

  int?penicillinAllergic = 0;
  int?allergyType = null;

  List <String> antibioticTextInput =
  [
    """ CefTRIAXone IV 2g OD
        
48-72 hour Review:
If patient is eating/drinking, active bleeding resolved and patient clinically stable; De-escalate as per culture results or empirically to Co-amoxiclav PO
If patient deteriorating; discuss with microbiology for escalation options

Duration:
Antimicrobial therapy of established infection should be limited to 5 days discuss longer courses with microbiology
""",
    """ CefTRIAXone IV 2g OD
            
48-72 hour Review:
If patient is eating/drinking, active bleeding resolved and patient clinically stable; De-escalate as per culture results or empirically to Ciprofloxacin PO
If patient deteriorating; discuss with microbiology for escalation options

Duration:
Antimicrobial therapy of established infection should be limited to 5 days discuss longer courses with microbiology
""",
    """ Ciprofloxacin PO 500mg BD (Only give IV if concerns over absorption
            
48-72 hour Review:
If patient is eating/drinking, active bleeding resolved and patient clinically stable; De-escalate as per culture results or empirically to Ciprofloxacin PO
If patient deteriorating; discuss with microbiology for escalation options

Duration:
Antimicrobial therapy of established infection should be limited to 5 days discuss longer courses with microbiology
""",
  ];

  String antibioticTextOutput = "Select Options";


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
      pageTitle: "Variceal Bleed",
      antibioticTextOutput: antibioticTextOutput,


      toggleBox1: YesNoToggleBasic(
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
