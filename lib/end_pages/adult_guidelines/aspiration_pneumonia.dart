import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/custom_widgets.dart';

class AspirationPneumonia extends StatefulWidget {
  const AspirationPneumonia({Key? key}) : super(key: key);

  @override
  _AspirationPneumoniaState createState() => _AspirationPneumoniaState();
}

class _AspirationPneumoniaState extends State<AspirationPneumonia> {

  int? penicillinAllergic = 0;
  int? allergyType = null;

  List <String> antibioticTextInput =
  [
    """ Doxycycline 100mg PO OD
+ Metronidazole 400mg PO TDS

If unable to swallow/clinically unstable: 
 Amoxicillin 1000 mg IV TDS + Metronidazole 500mg IV TDS

PO switch as soon as swallow deemed safe, otherwise continue with IV
""",
    """ Doxycycline 100mg PO OD
+ Metronidazole 400mg PO TDS

If unable to swallow/clinically unstable: 
 Levofloxacin 500mg IV OD + Metronidazole 500mg IV TDS

PO switch as soon as swallow deemed safe, otherwise continue with IV
""",
    """ Doxycycline 100mg PO OD
+ Metronidazole 400mg PO TDS

If unable to swallow/clinically unstable: 
 Levofloxacin 500mg IV OD + Metronidazole 500mg IV TDS

PO switch as soon as swallow deemed safe, otherwise continue with IV
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
      pageTitle: "Aspiration Pneumonia",
      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        textInput: 'Only indicated with pneumonic signs. Not on the day the patient has aspirated',
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
