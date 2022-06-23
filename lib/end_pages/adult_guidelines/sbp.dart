import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/custom_widgets.dart';

class SBP extends StatefulWidget {
  const SBP({Key? key}) : super(key: key);

  @override
  _SBPState createState() => _SBPState();
}

class _SBPState extends State<SBP> {

  int?penicillinAllergic = 0;
  int?allergyType = null;

  List <String> antibioticTextInput =
  [
    """ Piperacillin-Tazobactam IV 4.5g TDS
        
Prophylaxis:

 Co-trimoxazole PO 960mg OD (not suitable in sulphur allergy) or Ciprofloxacin PO 500mg BD
""",
    """ CefTRIAXone 2g OD
+ Metronidazole PO 400mg TDS

Prophylaxis: 
Discuss with Microbiologist
""",
    """ Ciprofloxacin PO 500mg BD or Co-trimoxazole PO 960mg BD, whichever has not been used prophylactically (if neither, preference for Ciprofloxacin ) + Metronidazole PO 400mg TDS

Prophylaxis:
Discuss with Microbiologist
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
      pageTitle: "Spontaneous Bacterial Peritonitis",
      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        textInput: 'Please attempt to send an ascitic tap is there is clinical evidence of spontaneous bacterial peritonitis',
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
