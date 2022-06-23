import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class GPCAP extends StatefulWidget {
  const GPCAP({Key? key}) : super(key: key);

  @override
  _GPCAPState createState() => _GPCAPState();
}

class _GPCAPState extends State<GPCAP> {

  int? isConfused = 0;
  int? raisedUrea = 0;
  int? isHyperventilating = 0;
  int? isOver65 = 0;
  int? isHypotensive = 0;
  int? penicillinAllergy = 0;

  int curbScore = 0;

  List <String> antibioticTextInput =
  [
    """Adults: Amoxicillin 500mg PO TDS

OR 

 Doxycycline 200mg once only on first day, then 100mg PO OD

OR 

 Clarithromycin 500mg BD

Children: please refer to BNFC, Doxycycline is not advised in children under 12 years of age

Duration: 5 days, review at day 3; continue for 7-10 days if initial poor response
""",
    """Adults: Clarithromycin 500mg BD

OR

 Doxycycline 200mg once only on first day, then 100mg PO OD

Children: please refer to BNFC, Doxycycline is not advised in children under 12 years of age

Duration: 5 days, review at day 3; continue for 7-10 days if initial poor response
""",
    """ANTIBIOTIC TEXT 3""",
    """ANTIBIOTIC TEXT 4""",
  ];

  String antibioticTextOutput = "Select Options";


  curbScoreFunction()
  {
    curbScore = 0;
    setState(() {
      if (isConfused == 1)
      {
        curbScore++;
      }
      if (raisedUrea == 1)
      {
        curbScore++;
      }
      if (isHyperventilating == 1)
      {
        curbScore++;
      }
      if (isOver65 == 1)
      {
        curbScore++;
      }
      if (isHypotensive == 1)
      {
        curbScore++;
      }

    });
  }

  notifyParent()
  {
    setState(() {
      if(curbScore <=2)
      {
        if(penicillinAllergy == 0)
        {
          antibioticTextOutput = antibioticTextInput[0];
        }
        else
        {
          antibioticTextOutput = antibioticTextInput[1];
        }

      }
      else
      {
        if(penicillinAllergy == 0)
          {
            antibioticTextOutput = antibioticTextInput[2];
          }
        else
          {
            antibioticTextOutput = antibioticTextInput[3];
          }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ClassicEndPage(
      pageTitle: 'Community Acquired Pneumonia',
      topPanelColour: kPrimaryCareOrange,
      antibioticTextOutput: antibioticTextOutput,
      widgetSpacing: 15,
      topRedBox: TopRedInfoBox(
        textInput: 'CURB Score',
        boxColour: kPaedsDropDownBlue,
        height: 25,
        textAlignment: Alignment.centerLeft,
        verticalPadding: 2,
        horizontalPadding: 5,
      ),

      toggleBox1: YesNoToggleSwitchScoring(
          title: '1. Confusion? (AMTS <8)',
          indexPosition: isConfused,
          onValueChanged: (index)
          {
            setState(() {
              isConfused = index;
              curbScoreFunction();
              notifyParent();

            });
          },
          ),

      toggleBox2: YesNoToggleSwitchScoring(
          title: "2. Urea >7",
          indexPosition: raisedUrea,
          onValueChanged: (index)
          {
            setState(() {
              raisedUrea = index;
              curbScoreFunction();
              notifyParent();
            });
          },
          ),

      toggleBox3: YesNoToggleSwitchScoring(
          title: '3. RR >29',
          indexPosition: isHyperventilating,
          onValueChanged: (index)
          {
            setState(() {
              isHyperventilating = index;
              curbScoreFunction();
              notifyParent();

            });
          },
          ),

      toggleBox4: YesNoToggleSwitchScoring(
          title: "4. Age >64",
          indexPosition: isOver65,
          onValueChanged: (index)
          {
            setState(() {
              isOver65 = index;
              curbScoreFunction();
              notifyParent();

            });
          },
          ),

      toggleBox5: YesNoToggleSwitchScoring(
          title: '5. SBP <90/DBP <60',
          indexPosition: isHypotensive,
          onValueChanged: (index)
          {
            setState(() {
              isHypotensive= index;
              curbScoreFunction();
              notifyParent();

            });
          },
      ),
      toggleBox6: SizedBox(
        width: double.infinity,
        height: 25.0,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5,),
              color: kHighlightedToggleRed,
              alignment: Alignment.centerLeft,
              child:
              Text('CURB score = $curbScore'),
            ),

          ],
        ),
      ),

      toggleBox7: YesNoToggleSwitchScoring(
          upperBoxHeight: 10,
          title: '6. Allergic to Penicillin?',
          indexPosition: penicillinAllergy,
          onValueChanged: (index)
          {
            setState(() {
              penicillinAllergy = index;
              notifyParent();
              curbScoreFunction();
            });
          },
          ),

    );
  }
}
