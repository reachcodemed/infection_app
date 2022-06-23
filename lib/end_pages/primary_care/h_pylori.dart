import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class GPHPylori extends StatefulWidget {
  const GPHPylori({Key? key}) : super(key: key);

  @override
  _GPHPyloriState createState() => _GPHPyloriState();
}

class _GPHPyloriState extends State<GPHPylori> {

  int? isPenicillinAllergic = 0;
  int? previousClarythromycin = 0;
  int? isRelapsed = 0;
  String antibioticTextOutput = "Select Options";

  List<String> antibioticTextInput =
  [
    """Omeprazole 20mg BD or Lansoprazole 30mg BD
+ Amoxicillin 1g BD

PLUS: 
EITHER Clarithromycin 500mg BD
OR Metronidazole 400mg BD

Children: please refer to BNFC

Duration: 7 days
""",
    """Omeprazole 20mg BD or Lansoprazole 30mg BD
+ Clarithromycin 500mg BD
+ Metronidazole 400mg BD

Children: please refer to BNFC

Duration: 7 days
""",
    """Omeprazole 20mg BD or Lansoprazole 30mg BD
+ Bismuth Subsalicylate 525mg QDS
+ Metronidazole 400mg BD
+ Tetracycline hydrochloride 500mg QDS

Children: please refer to BNFC

Duration: 7 days
""",
    """Omeprazole 20mg BD or Lansoprazole 30mg BD
+ Clarithromycin 500mg BD

PLUS: 
EITHER:  Levofloxacin 250mg BD
OR: Tetracycline hydrochloride 500mg QDS

Children: please refer to BNFC

Duration: 7 days
""",
    """Omeprazole 20mg BD or Lansoprazole 30mg BD
+ Amoxicillin 1g BD
+ Metronidazole 400mg BD

Children: please refer to BNFC

Duration: 7 days
""",
    """Omeprazole 20mg BD or Lansoprazole 30mg BD
+ Amoxicillin 1g BD

PLUS: 
EITHER:  Levofloxacin 250mg BD
OR: Tetracycline hydrochloride 500mg QDS

Children: please refer to BNFC

Duration: 7 days
""",
    """Omeprazole 20mg BD or Lansoprazole 30mg BD
+ Amoxicillin 1g BD

PLUS: 
EITHER:  Levofloxacin 250mg BD
OR: Tetracycline hydrochloride 500mg QDS

Children: please refer to BNFC

Duration: 7 days
""",
    """Omeprazole 20mg BD or Lansoprazole 30mg BD
+ Levofloxacin 250mg BD
+ Tetracycline hydrochloride 500mg QDS

Children: please refer to BNFC

Duration: 7 days
""",
  ];

  notifyParent()
  {
    if(isPenicillinAllergic == 0)
      {
        if(previousClarythromycin == 0)
          {
            if (isRelapsed == 0)
              {
                antibioticTextOutput = antibioticTextInput[0];

              }
            else
              {
                antibioticTextOutput = antibioticTextInput[6];
              }
          }
        else
          {
            if (isRelapsed == 0)
            {
              antibioticTextOutput = antibioticTextInput[4];
            }
            else
            {
              antibioticTextOutput = antibioticTextInput[5];
            }
          }

      }
    else
      {
        if(previousClarythromycin == 0)
        {
          if (isRelapsed == 0)
          {
            antibioticTextOutput = antibioticTextInput[1];
          }
          else
          {
            antibioticTextOutput = antibioticTextInput[3];
          }
        }
        else
        {
          if (isRelapsed == 0)
          {
            antibioticTextOutput = antibioticTextInput[2];
          }
          else
          {
            antibioticTextOutput = antibioticTextInput[7];
          }
        }
      }
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
      topPanelColour: kPrimaryCareOrange,
      pageTitle: "Helicobacter pylori",
      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        boxColour: kPaedsDropDownBlue,
        textInput: 'Always test for H.pylori before giving antibiotics. Leave a 2 week washout period after proton pump inhibitor (PPI) use before testing for H.pylori with a carbon-13 urea beath test (UBT) or a stool antigen test (STA), or laboratory-based serology.',
      ),

      toggleBox1: YesNoToggleBasic(
          title: '1. Allergic to Penicillin?',
          indexPosition: isPenicillinAllergic,
          onValueChanged: (index)
        {
          setState(() {
            isPenicillinAllergic = index;
            notifyParent();
          });
        },
          switchColour: kHighlightedToggleYellow,
         ),

      toggleBox2: YesNoToggleBasic(
        title: '2. Previous Clarithromycin',
        indexPosition: previousClarythromycin,
        onValueChanged: (index)
        {
          setState(() {
            previousClarythromycin = index;
            notifyParent();
          });
        },
        switchColour: kHighlightedToggleYellow,
      ),

      toggleBox3: YesNoToggleBasic(
        title: '3. Relapsed Infection?',
        indexPosition: isRelapsed,
        onValueChanged: (index)
        {
          setState(() {
            isRelapsed = index;
            notifyParent();
          });
        },
        switchColour: kHighlightedToggleYellow,
      ),
      

    );
  }
}
