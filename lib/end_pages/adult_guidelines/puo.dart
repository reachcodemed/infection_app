import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/custom_widgets.dart';

class SepsisOfUnknownOrigin extends StatefulWidget {
  const SepsisOfUnknownOrigin({Key? key}) : super(key: key);

  @override
  _SepsisOfUnknownOriginState createState() => _SepsisOfUnknownOriginState();
}

class _SepsisOfUnknownOriginState extends State<SepsisOfUnknownOrigin> {


  int?penicillinAllergic = 0;
  int?allergyType = null;

  List <String> antibioticTextInput =
  [
    """  CefTRIAXone IV 2g OD
+ Gentamicin IV STAT (see trust dosing guidelines)
+ Teicoplanin IV (see trust dosing guidelines)

48-72 hr review:
A thorough review should occur every 24 hours to identify the source, review microbiology and refine antimicrobial choice. Discuss all patients with microbiology within 48 hours if focus of infection remains unidentified. Stop antibiotics if infection has been ruled out or of low suspicion and re-culture is needed.
""",
    """ CefTRIAXone IV 2g OD
+ Gentamicin IV STAT (see trust dosing guidelines)
+ Teicoplanin IV (see trust dosing guidelines)

48-72 hr review:
A thorough review should occur every 24 hours to identify the source, review microbiology and refine antimicrobial choice. Discuss all patients with microbiology within 48 hours if focus of infection remains unidentified. Stop antibiotics if infection has been ruled out or of low suspicion and re-culture is needed.
""",
    """ Ciprofloxacin IV 400mg TDS (or PO 750mg BD)
+ Gentamicin IV STAT (see trust dosing guidelines)
+ Teicoplanin IV (see trust dosing guidelines)

48-72 hr review:
A thorough review should occur every 24 hours to identify the source, review microbiology and refine antimicrobial choice. Discuss all patients with microbiology within 48 hours if focus of infection remains unidentified. Stop antibiotics if infection has been ruled out or of low suspicion and re-culture is needed.

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
      pageTitle: "Pyrexia of Unknown Origin",
      antibioticTextOutput: antibioticTextOutput,

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
