import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/custom_widgets.dart';

class NecFasc extends StatefulWidget {
  const NecFasc({Key? key}) : super(key: key);

  @override
  _NecFascState createState() => _NecFascState();
}

class _NecFascState extends State<NecFasc> {


  int?penicillinAllergic = 0;

  List <String> antibioticTextInput =
  [
    """ Piperacillin-Tazobactam 4.5g IV TDS
+ Clindamycin 1.2g IV QDS
+ Gentamicin IV (see trust dosing guidelines)
+ Teicoplanin IV (see trust dosing guidelines)

Review at 72 hours and discuss rationalisation with microbiology. Clindamycin must not be continued beyond 72 hours without microbiology advice.
""",
    """ Ciprofloxacin 400mg IV TDS
+ Clindamycin 1.2g IV QDS
+ Gentamicin IV (see trust dosing guidelines)
+ Teicoplanin IV (see trust dosing guidelines)

Review at 72 hours and discuss rationalisation with microbiology. Clindamycin must not be continued beyond 72 hours without microbiology advice. 
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
      else
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
      pageTitle: "Necrotisiing Fasciitis",
      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        textInput: '•Urgent surgical review and debridement\n•Urgent gram stain on debridement tissue\n•Send blood cultures\n•Discuss with Consultant Microbiologist urgently',
      ),

      toggleBox1: YesNoToggleBasic(
        title: '1. Allergic to Penicillin?',
        indexPosition: penicillinAllergic,
        
        onValueChanged: (index)
        {

          setState(()
          {
            penicillinAllergic = index;
          });
          notifyParent();

        },
      ),


    );
  }
}
