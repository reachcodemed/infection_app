import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class CAP extends StatefulWidget {
  const CAP({Key? key}) : super(key: key);

  @override
  _CAPState createState() => _CAPState();
}

class _CAPState extends State<CAP> {

  int? isConfused = 0;
  int? raisedUrea = 0;
  int? isHyperventilating = 0;
  int? isOver65 = 0;
  int? isHypotensive = 0;
  int? penicillinAllergy = 0;
  int? allergyType = null;

  int curbScore = 0;

  List <String> antibioticTextInput =
  [
    """ Amoxicillin 1000mg PO TDS for 5 days
+/- Doxycycline 200mg PO OD for 5 days. Consider IV for 24-48 hours if concerns over absorption.

 Doxycycline is not advised during pregnancy replace with Clarithromycin
""",
    """ Doxycycline 200mg PO OD for 5 days.

 Doxycycline is not advised during pregnancy replace with Clarithromycin
""",
    """ Doxycycline 200mg PO OD for 5 days.

 Doxycycline is not advised during pregnancy replace with Clarithromycin
""",
    """ Co-amoxiclav 1.2g IV TDS
+ Doxycycline 200mg PO OD

[or Clarythromicin 500mg IV BD if nil by mouth, nor absorbing or pregnant]
""",
    """ CefTRIAXone 2g IV OD
+/- Doxycycline 200mg PO OD for 5 days. Consider IV for 24-48 hours if concerns over absorption

 Doxycycline is not advised during pregnancy replace with Clarithromycin 500mg PO BD
""",
    """ Levofloxacin 500mg PO/IV BD (sufficient for atypical cover)""",

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
          else if (penicillinAllergy == 1 && allergyType ==1)
            {
              antibioticTextOutput = antibioticTextInput[1];
            }
          else if (penicillinAllergy == 1&& allergyType ==0)
            {
              antibioticTextOutput = antibioticTextInput[2];
            }
        }
      else if(curbScore >2)
      {
        if(penicillinAllergy == 0)
        {
          antibioticTextOutput = antibioticTextInput[3];
        }
        else if (penicillinAllergy == 1 && allergyType ==1)
        {
          antibioticTextOutput = antibioticTextInput[4];
        }
        else if (penicillinAllergy == 1&& allergyType ==0)
        {
          antibioticTextOutput = antibioticTextInput[5];
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
      pageTitle: 'Community Acquired Pneumonia',
      antibioticTextOutput: antibioticTextOutput,
      widgetSpacing: 15,
      topRedBox: TopRedInfoBox(
        textInput: 'CURB Score',
        height: 25,
        textAlignment: Alignment.centerLeft,
        verticalPadding: 2,
        horizontalPadding: 5,
      ),
      toggleBox1: YesNoToggleSwitchScoring(title: '1. Confusion? (AMTS <8)', indexPosition: isConfused, switchColour: kHighlightedToggleRed,
          onValueChanged: (index)
          {
            setState(() {
              isConfused = index;
            });
            curbScoreFunction();
            notifyParent();
          },
          ),

      toggleBox2: YesNoToggleSwitchScoring(
          title: "2. Urea >7",
        switchColour: kHighlightedToggleRed,
          indexPosition: raisedUrea,
          onValueChanged: (index)
          {
            setState(() {
              raisedUrea = index;

            });
            curbScoreFunction();
            notifyParent();
          },
          ),

      toggleBox3: YesNoToggleSwitchScoring(
          title: '3. RR >29',
        switchColour: kHighlightedToggleRed,
          indexPosition: isHyperventilating,
          onValueChanged: (index)
          {
            setState(() {
              isHyperventilating = index;

            });
            curbScoreFunction();
            notifyParent();
          },
          ),

      toggleBox4: YesNoToggleSwitchScoring(
          title: "4. Age >64",
        switchColour: kHighlightedToggleRed,
          indexPosition: isOver65,
          onValueChanged: (index)
          {
            setState(() {
              isOver65 = index;
              notifyParent();
            });
            curbScoreFunction();
            notifyParent();
          },
          ),

      toggleBox5: YesNoToggleSwitchScoring(
          title: '5. SBP <90/DBP <60',
          indexPosition: isHypotensive,
        switchColour: kHighlightedToggleRed,
          onValueChanged: (index)
          {
            setState(() {
              isHypotensive= index;
              notifyParent();
            });
            curbScoreFunction();
            notifyParent();
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
          switchColour: kHighlightedToggleRed,
          title: '6. Allergic to Penicillin?',
          indexPosition: penicillinAllergy,
          onValueChanged: (index)
          {
            setState(()
            {
              penicillinAllergy = index;
              penicillinAllergy == 1?allergyType = 0:allergyType = null;
            });
            curbScoreFunction();
            notifyParent();
          },
          ),
      penicillinToggle: PenicillinSlider(
      indexPosition: allergyType,
      onValueChanged: (index)
      {

        setState(() {
          if (penicillinAllergy == 1)
          {
            allergyType = index;
          }
          else
          {
            allergyType = null;
          }

        });

        curbScoreFunction();
        notifyParent();
      },
    ),

    );
  }
}
