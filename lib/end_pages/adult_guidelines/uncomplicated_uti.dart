import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/custom_widgets.dart';

class UncomplicatedUTI extends StatefulWidget {
  const UncomplicatedUTI({Key? key}) : super(key: key);

  @override
  _UncomplicatedUTIState createState() => _UncomplicatedUTIState();
}

class _UncomplicatedUTIState extends State<UncomplicatedUTI> {

  int?eGFRLessThan45 = 0;
  int?penicillinAllergic = 0;

  List <String> antibioticTextInput =
  [
    """ Pivmecillinam 400mg PO TDS

Duration: Women = 3 days, Men = 7 days

Reduce dose to 200mg TDS form day 4
""",
    """ Nitrofurantoin PO 50mg QDS

Duration: Women = 3 days, Men = 7 days
""",
    """ Fosfomycin 3g  PO STAT

Duration: Every 48 hours for 3 doses
""",

  ];

  String antibioticTextOutput = "Select Options";


  notifyParent()
  {
    setState(() {
      if((eGFRLessThan45 == 0 || eGFRLessThan45 == 1) && penicillinAllergic == 0)
        {
          antibioticTextOutput = antibioticTextInput[0];
        }
      else if(eGFRLessThan45 == 0 && penicillinAllergic == 1)
          {
            antibioticTextOutput = antibioticTextInput[1];
          }
      else if(eGFRLessThan45 == 1 && penicillinAllergic == 1)
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
      pageTitle: "Uncomplicated UTI",
      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        textInput: 'Ensure urine send for C&S, check recent C&S reports. There should be no fever or flank pain',
      ),

      toggleBox1: YesNoToggleBasic(
        title: '1. eGFR <45ml/min?',
        indexPosition: eGFRLessThan45,
        
        onValueChanged: (index)
        {

          setState(()
          {
            eGFRLessThan45= index;
          });
          notifyParent();

        },
      ),
      toggleBox2: YesNoToggleBasic(
        title: '2. Allergic to penicillin?',
        indexPosition: penicillinAllergic,
        
        onValueChanged: (index)
        {

          setState(()
          {
            penicillinAllergic = index;
          });
          notifyParent();

        },),
      
    );
  }
}
