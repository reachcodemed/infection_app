import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/custom_widgets.dart';

class Empyema extends StatefulWidget {
  const Empyema({Key? key}) : super(key: key);

  @override
  _EmpyemaState createState() => _EmpyemaState();
}

class _EmpyemaState extends State<Empyema> {


  int?penicillinAllergic = 0;
  int?allergyType = null;

  List <String> antibioticTextInput =
  [
    """ Co-amoxiclav 1.2g IV TDS

If MRSA colonised: consider the addition of Linezolid 600mg PO BD (near 100% bioavailability). If IV is required: Teicoplanin (dose as per trust guidelines)

Discuss all hospital-acquired empyemas with a microbiologist
""",
    """ Ceftriaxone 2g IV OD    
If pus putrid - likely anaerobes add metronidazole 500mg IV TDS

If MRSA colonised: consider the addition of Linezolid 600mg PO BD (near 100% bioavailability). If IV is required: Teicoplanin (dose as per trust guidelines)

Discuss all hospital-acquired empyemas with a microbiologist
""",
    """ Levofloxacin 500mg IV BD
If pus putrid - likely anaerobes add metronidazole 500mg IV TDS

If MRSA colonised: consider the addition of Linezolid 600mg PO BD (near 100% bioavailability). If IV is required: Teicoplanin (dose as per trust guidelines)

Discuss all hospital-acquired empyemas with a microbiologist
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
      pageTitle: "Empyema",
      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        textInput: 'All hospital acquired empyemas must be discussed with a consultant microbiologist',
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
