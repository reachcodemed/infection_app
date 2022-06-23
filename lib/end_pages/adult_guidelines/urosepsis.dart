import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/custom_widgets.dart';

class Urosepsis extends StatefulWidget {
  const Urosepsis({Key? key}) : super(key: key);

  @override
  _UrosepsisState createState() => _UrosepsisState();
}

class _UrosepsisState extends State<Urosepsis> {


  int?penicillinAllergic = 0;
  int?allergyType = null;

  List <String> antibioticTextInput =
  [
    """ Amikacin IV STAT (see local dosing guidelines) maximum 72 hours
+ CefTRIAXone IV 2g OD

48-72 hour review:
Apyrexial; no evidence of collection; clinically well: de-escalate to oral option as per sensitivities

Empirical option:
 Co-amoxiclav PO 625 mg PO TDS
Duration: 10-14 days if imaging displays no collection/deep source
""",
    """ Amikacin IV STAT (see local dosing guidelines) maximum 72 hours
+ CefTRIAXone IV 2g OD

48-72 hour review:
Apyrexial; no evidence of collection; clinically well: de-escalate to oral option as per sensitivities

Empirical option:
 Ciprofloxacin 500 mg PO BD
Duration: 10-14 days if imaging displays no collection/deep source
""",
    """ Amikacin IV STAT (see local dosing guidelines) maximum 72 hours
+  Ciprofloxacin 400mg IV BD (or 500 mg PO BD)

48-72 hour review:
Apyrexial; no evidence of collection; clinically well: de-escalate to oral option as per sensitivities

Empirical option:
 Ciprofloxacin 500 mg PO BD
Duration: 10-14 days if imaging displays no collection/deep source
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
      pageTitle: "Urosepsis/pyelonephritis",
      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        textInput: '•Ensure urine sent for C&S\n•Check recent C&S results\n•Treatment duration - urosepsis: 5 days\n•Treatment duration pyelonephritis: 10-14 days',
      ),


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
