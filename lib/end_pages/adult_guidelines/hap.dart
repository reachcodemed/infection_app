import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class HAP extends StatefulWidget {
  const HAP({Key? key}) : super(key: key);

  @override
  _HAPState createState() => _HAPState();
}

class _HAPState extends State<HAP> {

  int? severity = 0;
  int? penicillinAllergic = 0;
  int? allergyType = null;

  List <String> antibioticTextInput =
  [
    """ Doxycycline 200mg PO OD

If MRSA colonised: consider the addition of Linezolid 600mg PO BD (near 100% bioavailability). If IV required: Teicoplanin (dose as per trust guideline) 
""",
    """ Co-amoxiclav 625mg PO TDS (1.2g IV TDS if not absorbing or unable to swallow)

If MRSA colonised: consider the addition of Linezolid 600mg PO BD (near 100% bioavailability). If IV required: Teicoplanin (dose as per trust guideline) 
""",
    """ Piperacillin-Tazobactam 4.5g IV TDS

If MRSA colonised: consider the addition of Linezolid 600mg PO BD (near 100% bioavailability). If IV required: Teicoplanin (dose as per trust guideline) 
""",
    """ Levofloxacin 500mg PO OD (IV if not absorbing/able to swallow)

If MRSA colonised: consider the addition of Linezolid 600mg PO BD (near 100% bioavailability). If IV required: Teicoplanin (dose as per trust guideline) 
""",
    """ CefTAZIDime 2g IV TDS

If MRSA colonised: consider the addition of Linezolid 600mg PO BD (near 100% bioavailability). If IV required: Teicoplanin (dose as per trust guideline)
""",
    """ Ciprofloxacin 400mg IV BD

If MRSA colonised: consider the addition of Linezolid 600mg PO BD (near 100% bioavailability). If IV required: Teicoplanin (dose as per trust guideline)
""",
  ];

  String antibioticTextOutput = "Select Options";


  notifyParent()
  {
    setState(() {
      if(severity == 0)
        {
          antibioticTextOutput = antibioticTextInput[0];
        }
      else if (severity == 1)
        {
          if(penicillinAllergic == 0)
            {
              antibioticTextOutput = antibioticTextInput[1];
            }
          else if(penicillinAllergic == 1)
            {
              antibioticTextOutput = antibioticTextInput[3];
            }
        }

      else if (severity == 2)
        {
          if(penicillinAllergic == 0)
          {
            antibioticTextOutput = antibioticTextInput[2];
          }
          else if(penicillinAllergic == 1 && allergyType == 1)
          {
            antibioticTextOutput = antibioticTextInput[4];
          }
          else if(penicillinAllergic == 1 && allergyType == 0)
          {
            antibioticTextOutput = antibioticTextInput[5];
          }
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
      pageTitle: "Hospital Acquired Pneumonia",
      antibioticTextOutput: antibioticTextOutput,

      toggleBox1: ToggleSwitchTriple(
          title: '1. Severity?', 
          indexPosition: severity,
          onValueChanged: (index)
        {
          setState(() {
            severity = index;
          });
          notifyParent();
        },
          switchColour: kHighlightedToggleRed,
          firstText: 'Mild',
          secondText: 'Moderate',
          thirdText: 'Severe',
      ),

      toggleBox2: YesNoToggleBasic(
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
