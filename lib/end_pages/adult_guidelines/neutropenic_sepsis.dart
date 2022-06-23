import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/custom_widgets.dart';

class NeutropenicSepsis extends StatefulWidget {
  const NeutropenicSepsis({Key? key}) : super(key: key);

  @override
  _NeutropenicSepsisState createState() => _NeutropenicSepsisState();
}

class _NeutropenicSepsisState extends State<NeutropenicSepsis> {


  int?penicillinAllergic = 0;
  int? allergyType;

  List <String> antibioticTextInput =
  [
    """ Piperacillin-Tazobactam IV 4.5g TDS
+ Gentamicin IV (see local dosing guidelines). Do not delay the first dose waiting for exact body weight or creatinine clearance

48-72 hr review:
Review microbiology and tailor treatment as per results and clinical response.

Ongoing pyrexia and no positive microbiology:
 Meropenem 1g IV TDS + Teicoplanin (see local dosing guidelines).
""",
    """ CefTAZIDime IV 2g TDS
+ Gentamicin IV (see local dosing guidelines). Do not delay the first dose waiting for exact body weight or creatinine clearance
+ Teicoplanin IV (see local dosing guidelines)

48-72 hr review:
Review microbiology and tailor treatment as per results and clinical response.

Ongoing pyrexia and no positive microbiology:
 Meropenem 1g IV TDS + Teicoplanin (see local dosing guidelines).
""",
    """ Ciprofloxacin IV 400mg TDS (or PO 750mg BD)
+ Gentamicin IV (see local dosing guidelines). Do not delay the first dose waiting for exact body weight or creatinine clearance
+ Teicoplanin IV (see local dosing guidelines)

48-72 hr review:
Review microbiology and tailor treatment as per results and clinical response.

Ongoing pyrexia and no positive microbiology:
 Meropenem 1g IV TDS + Teicoplanin (see local dosing guidelines).
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
      pageTitle: "Neutropenic Sepsis",
      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        textInput: 'Discuss with the on-call haematologist as soon as possible. Neutropenia = <0.5 or <1 with expected decline to <0.5',
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
            allergyType = index;
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
