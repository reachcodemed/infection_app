import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/custom_widgets.dart';

class PregnantUTI extends StatefulWidget {
  const PregnantUTI({Key? key}) : super(key: key);

  @override
  _PregnantUTIState createState() => _PregnantUTIState();
}

class _PregnantUTIState extends State<PregnantUTI> {


  int?penicillinAllergic = 0;
  int?allergyType = null;

  List <String> antibioticTextInput =
  [
    """Cefalexin PO 500mg TDS for 7 days""",
    """ Nitrofurantoin 50 mg QDS for 7 days (avoid in the last 4 weeks of pregnancy)

Or Trimethoprim 200mg BD for 7 days (contraindicated in the first trimester of pregnancy)
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
        antibioticTextOutput = antibioticTextInput[0];
      }
      else if(penicillinAllergic == 1 && allergyType ==0)
      {
        antibioticTextOutput = antibioticTextInput[1];
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
      pageTitle: "UTI in pregnancy",
      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        textAlignment: Alignment.centerLeft,
        textInput: '• Ensure urine sent for C&S\n• Check recent C&S results\n• No fever or flank pain\n• Check gestation',
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
