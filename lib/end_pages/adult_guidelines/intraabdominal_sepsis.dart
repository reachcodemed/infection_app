import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/custom_widgets.dart';

class IntraAbdominalSepsis extends StatefulWidget {
  const IntraAbdominalSepsis({Key? key}) : super(key: key);

  @override
  _IntraAbdominalSepsisState createState() => _IntraAbdominalSepsisState();
}

class _IntraAbdominalSepsisState extends State<IntraAbdominalSepsis> {


  int?penicillinAllergic = 0;
  int?allergyType = null;

  List <String> antibioticTextInput =
  [
    """ Co-amoxiclav IV 1.2g TDS
Give 1-2 doses of Gentamicin IV if haemodynamically unstable (See trust dosing guide)
        
In bowel perforation or where abscess is present: add Metronidazole PO 400mg TDS ( Co-amoxiclav has suitable anaerobic cover in all other indications)

Oral metronidazole has very high oral bioavailability. Only give IV if concerns over absorption.

48-72 hour Review:
Clinical improvement and NO deep source of infection found; De-escalate as per culture results or empirically to Co-amoxiclav PO

Clinical deterioration or still pyrexial and requiring Gentamicin; consider abscess and discuss with microbiology.
""",
    """ CefTRIAXone IV 2g OD
Plus Metronidazole PO 400mg TDS
Oral metronidazole has very high oral bioavailability. Only give IV if overtly septic or concerns over absorption.
            
Give 1-2 doses of Gentamicin IV if haemodynamically unstable (See trust dosing guide)

48-72 hour Review:
Clinical improvement and NO deep source of infection found; De-escalate as per culture results or empirically to Ciprofloxacin and Metronidazole PO

Clinical deterioration or still pyrexial and requiring Gentamicin; consider abscess and discuss with microbiology.
""",
    """ Ciprofloxacin PO 500mg BD
Plus Metronidazole PO 400mg TDS
Oral metronidazole and Ciprofloxacin both have very high oral bioavailability. Only give IV if concerns over absorption.
            
Give 1-2 doses of Gentamicin IV if haemodynamically unstable (See trust dosing guide)
48-72 hour Review:
Clinical improvement and NO deep source of infection found; De-escalate as per culture results or empirically to Ciprofloxacin and Metronidazole PO.

Clinical deterioration or still pyrexial and requiring Gentamicin; consider abscess and discuss with microbiology.
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
      pageTitle: "Intra-Abdominal Sepsis",
      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        textInput: 'Use this guideline for:\n\nCholecystitis, Cholangitis, Biliary Sepsis, Diverticulitis, Appendicitis, Perforation',
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
