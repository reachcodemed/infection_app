import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/custom_widgets.dart';

class PID extends StatefulWidget {
  const PID({Key? key}) : super(key: key);

  @override
  _PIDState createState() => _PIDState();
}

class _PIDState extends State<PID> {

  int?isPregnant = 0;
  int?penicillinAllergic = 0;
  int?allergyType = null;

  List <String> antibioticTextInput =
  [
    """OUTPATIENT: 
Intramuscular CefTRIAXone 1g once only IM
+ Doxycycline 100mg PO BD for 14 days
+ Metronidazole 400mg PO BD for 14 days

INPATIENT:
 Ceftriaxone 2g IV OD (until 24 hours afebrile)
+ Doxycycline 100mg PO BD for 14 days
+ Metronidazole 400mg PO BD for 14 days
""",
    """OUTPATIENT: 
Intramuscular CefTRIAXone 1g once only IM
+ Doxycycline 100mg PO BD for 14 days
+ Metronidazole 400mg PO BD for 14 days

INPATIENT:
 Ceftriaxone 2g IV OD (until 24 hours afebrile)
+ Doxycycline 100mg PO BD for 14 days
+ Metronidazole 400mg PO BD for 14 days
""",
    """OUTPATIENT: 
 Ofloxacin 400mg BD for 14 days
+ Metronidazole 400mg PO BD for 14 days

INPATIENT:
 Clindamycin 900mg IV TDS
+ Gentamicin IV (see local dosing guidelines)

Followed by:
+ Doxycycline 100mg PO BD to complete 14 days
+ Metronidazole 400mg PO BD to complete 14 days
""",
    """OUTPATIENT: 
Intramuscular CefTRIAXone 1g once only IM
+ Erythromycin 500mg PO BD for 14 days
+ Metronidazole 400mg PO BD for 14 days

INPATIENT:
 Ceftriaxone 2g IV OD (until 24 hours afebrile)
+ Erythromycin 500mg PO BD for 14 days
+ Metronidazole 400mg PO BD for 14 days
""",
    """OUTPATIENT: 
Intramuscular CefTRIAXone 1g once only IM
+ Erythromycin 500mg PO BD for 14 days
+ Metronidazole 400mg PO BD for 14 days

INPATIENT:
 Ceftriaxone 2g IV OD (until 24 hours afebrile)
+ Erythromycin 500mg PO BD for 14 days
+ Metronidazole 400mg PO BD for 14 days
""",
    """Discuss with Consultant Microbiologist""",
  ];

  String antibioticTextOutput = "Select Options";


  notifyParent()
  {
    setState(() {
      if(isPregnant==0 && penicillinAllergic==0)
        {
          antibioticTextOutput = antibioticTextInput[0];
        }
      else if(isPregnant==0 && penicillinAllergic==1)
        {
          if(allergyType == 1)
            {
              antibioticTextOutput = antibioticTextInput[1];
            }
          else if (allergyType == 0)
            {
              antibioticTextOutput = antibioticTextInput[2];
            }
        }
      else if (isPregnant==1 && penicillinAllergic == 0)
        {
          antibioticTextOutput = antibioticTextInput[3];
        }
      else if (isPregnant==1 && penicillinAllergic == 1)
        {
          if(allergyType == 1)
          {
            antibioticTextOutput = antibioticTextInput[4];
          }
          else if (allergyType == 0)
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
      pageTitle: "Pelvic Inflammatory Disease",
      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        textInput: 'Collect endocervical swab for Chlamydia NAAT testing and Gonorrhoea culture',
      ),

      toggleBox1: YesNoToggleBasic(
        title: '1. Patient pregnant?',
        indexPosition: isPregnant,
        
        onValueChanged: (index)
        {

          setState(()
          {
            isPregnant = index;
          });
          notifyParent();

        },
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
