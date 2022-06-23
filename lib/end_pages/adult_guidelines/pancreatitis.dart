import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/custom_widgets.dart';

class Pancreatitis extends StatefulWidget {
  const Pancreatitis({Key? key}) : super(key: key);

  @override
  _PancreatitisState createState() => _PancreatitisState();
}

class _PancreatitisState extends State<Pancreatitis> {

  int?ctEvidence = 0;
  int?penicillinAllergic = null;
  int?allergyType = null;

  List <String> antibioticTextInput =
  [
    """Antibiotic therapy is not indicated if there is no evidence of pancreatic necrosis.""",
    """ Piperacillin-Tazobactam IV 4.5g TDS

48-72 hour review:
All cases should be discussed with microbiology
Duration:
Should be guided by response discuss with microbiology.
""",
    """ Meropenem 1g TDS

48-72 hour review:
All cases should be discussed with microbiology
Duration:
Should be guided by response discuss with microbiology.
""",
    """ Teicoplanin IV (see trust dosing guidelines)
+ Ciprofloxacin 750mg PO (IV 400mg) BD
+ Metronidazole 400mg PO (IV 500mg) TDS

48-72 hour review:
All cases should be discussed with microbiology
Duration:
Should be guided by response discuss with microbiology
""",
  ];

  String antibioticTextOutput = "Select Options";


  notifyParent()
  {
    setState(() {
      if(ctEvidence == 0)
      {
        antibioticTextOutput = antibioticTextInput[0];
      }

      else if(ctEvidence == 1)
        {
          if(penicillinAllergic == 0)
            {
              antibioticTextOutput = antibioticTextInput[1];
            }
          else if(penicillinAllergic == 1 && allergyType == 1)
            {
              antibioticTextOutput = antibioticTextInput[2];
            }
          else if(penicillinAllergic ==1 && allergyType == 0)
            {
              antibioticTextOutput = antibioticTextInput[3];
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
      pageTitle: "Pancreatitis",
      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        textInput: 'Antibiotics are not indicated in pancreatitis routinely, unless there is radiological evidence of necrosis (>=30%)',
      ),

      toggleBox1: YesNoToggleBasic(
        title: '1. CT evidence of necrosis?',
        indexPosition: ctEvidence,
        
        onValueChanged: (index)
        {

          setState(()
          {
            ctEvidence = index;
            ctEvidence == 1? penicillinAllergic = 0 : penicillinAllergic = null;
            ctEvidence == 1 ? allergyType = allergyType: allergyType = null;
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
            ctEvidence == 1? penicillinAllergic = index:penicillinAllergic = null;

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
