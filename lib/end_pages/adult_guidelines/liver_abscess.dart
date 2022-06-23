import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/custom_widgets.dart';

class LiverAbscess extends StatefulWidget {
  const LiverAbscess({Key? key}) : super(key: key);

  @override
  _LiverAbscessState createState() => _LiverAbscessState();
}

class _LiverAbscessState extends State<LiverAbscess> {


  int? allergyType = null;
  int? penicillinAllergic = 0;

  List <String> antibioticTextInput =
  [
    """ CefTRIAXone IV 2g OD
+ Metronidazole PO 400mg TDS
Oral Metronidazole has very high oral bioavailability. Only give IV if overtly septic or concerns over absorption.
            
Give 1-2 doses of Gentamicin IV if haemodynamically unstable (See trust dosing guide)

48-72 hour review:
All cases should be discussed with microbiology
Drainage should be attempted where viable
Duration should be guided by source control, response and repeat imaging where indicated, discuss with microbiology
""",
    """ CefTRIAXone IV 2g OD
+ Metronidazole PO 400mg TDS
Oral Metronidazole has very high oral bioavailability. Only give IV if overtly septic or concerns over absorption.
            
Give 1-2 doses of Gentamicin IV if haemodynamically unstable (See trust dosing guide)

48-72 hour review:
All cases should be discussed with microbiology
Drainage should be attempted where viable
Duration should be guided by source control, response and repeat imaging where indicated, discuss with microbiology.
""",
    """ Teicoplanin IV (see trust dosing guidelines)
+ Ciprofloxacin PO 750mg BD
+ Metronidazole PO 400mg TDS
Oral Metronidazole has very high oral bioavailability. Only give IV if overtly septic or concerns over absorption
            
Give 1-2 doses of Gentamicin IV if haemodynamically unstable (See trust dosing guide)

48-72 hour review:
All cases should be discussed with microbiology
Drainage should be attempted where viable
Duration should be guided by source control, response and repeat imaging where indicated, discuss with microbiology.
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
      pageTitle: "Liver Abscess",
      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        textInput: 'Obtain sample fro aspirate or drainage. Send clotted blood for Amoebic Serology and ensure blood cultures have been sent',
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
