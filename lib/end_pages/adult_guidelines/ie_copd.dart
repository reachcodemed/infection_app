import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class IECOPD extends StatefulWidget {
  const IECOPD({Key? key}) : super(key: key);

  @override
  _IECOPDState createState() => _IECOPDState();
}

class _IECOPDState extends State<IECOPD> {

  int? isSevere = 0;
  int? isPneumonic = 0;
  int? historyOfPseudomonas = 0;
  int? penicillinAllergy = null;
  int? allergyType = null;

  int curbScore = 0;

  List <String> antibioticTextInput =
  [
    """ Doxycycline 200mg PO OD (not suitable in pregnancy)

48-72 hr review:
Clinical improvement - continue for 5 days and stop
Clinical deterioration - escalate and discuss with microbiology
""",
    """ Co-amoxiclav 625mg PO TDS (IV 1.2g TDS if severe/unable to tolerate PO)

48-72 hr review: 
Clinical improvement - switch to PO (if on IV) complete 7 (10 days in severe disease or slow to respond)
Clinical deterioration - escalate and discuss with microbiology
""",
    """ Levofloxacin 500mg PO BD  (IV 500mg BD if severe/unable to tolerate PO)

48-72 hr review: 
Clinical improvement - switch to PO (if on IV) complete 7 (10 days in severe disease or slow to respond)
Clinical deterioration - escalate and discuss with microbiology
""",
    """ Piperacillin-Tazobactam 4.5g IV TDS (discuss sensitivity with micro)

48-72 hr review: 
Clinical improvement - chase MC&S for PO option. Complete 7 (10 days in severe disease or slow to respond)
Clinical deterioration - escalate and discuss with microbiology
""",
    """ CefTAZIDime 2g IV TDS (discuss sensitivity with micro)

48-72 hr review: 
Clinical improvement - chase MC&S for PO option. Complete 7 (10 days in severe disease or slow to respond)
Clinical deterioration - escalate and discuss with microbiology
""",
    """ Ciprofloxacin 500mg PO BD (IV 400mg BD) (discuss sensitivity with microbiology)

48-72 hr review: 
Clinical improvement - chase MC&S for PO option. Complete 7 (10 days in severe disease or slow to respond)
Clinical deterioration - escalate and discuss with microbiology
""",
  ];

  String antibioticTextOutput = "Select Options";


  notifyParent()
  {
    setState(() {
      if(isSevere == 0 && isPneumonic == 0 && historyOfPseudomonas == 0)
        {
          antibioticTextOutput = antibioticTextInput[0];
        }
      else if ((isSevere == 1 || isPneumonic == 1)&& historyOfPseudomonas == 0 && penicillinAllergy == 0)
        {
          antibioticTextOutput = antibioticTextInput[1];
        }
      else if ((isSevere == 1 || isPneumonic == 1) && historyOfPseudomonas == 0 && penicillinAllergy == 1)
      {
        antibioticTextOutput = antibioticTextInput[2];
      }

      else if(historyOfPseudomonas == 1 && penicillinAllergy == 0)
        {
          antibioticTextOutput = antibioticTextInput[3];
        }
      else if(historyOfPseudomonas == 1 && penicillinAllergy == 1 && allergyType == 1)
      {
        antibioticTextOutput = antibioticTextInput[4];
      }
      else if(historyOfPseudomonas == 1 && penicillinAllergy == 1 && allergyType == 0)
      {
        antibioticTextOutput = antibioticTextInput[5];
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
      pageTitle: 'Infective Exacerbation of COPD',
      antibioticTextOutput: antibioticTextOutput,
      widgetSpacing: 15,
      topRedBox: TopRedInfoBox(
        textInput: 'Risk Assessment',
        height: 25,
        textAlignment: Alignment.centerLeft,
        verticalPadding: 2,
        horizontalPadding: 5,
      ),

      toggleBox1: YesNoToggleSwitchScoring(
          title: '1. Severe?',
          indexPosition: isSevere,
          switchColour: kHighlightedToggleRed,
          onValueChanged: (index)
          {
            setState(() {
              historyOfPseudomonas == 1?isSevere = null:isSevere = index;

              //isSevere == 1 || isPneumonic == 1?penicillinAllergy = 0:penicillinAllergy = null;

              isPneumonic == null && isSevere == null?penicillinAllergy = penicillinAllergy: isPneumonic == 1 || isSevere == 1? penicillinAllergy = 0:penicillinAllergy = null;

              //penicillinAllergy == null? allergyType = null: allergyType = allergyType;

              penicillinAllergy == null? allergyType = null: penicillinAllergy == 1|| penicillinAllergy == 0?allergyType = allergyType: allergyType = null;
            });

            notifyParent();



          },
          ),

      toggleBox2: YesNoToggleSwitchScoring(
          title: "2. Pneumonic changes on imaging?",
          indexPosition: isPneumonic,
          switchColour: kHighlightedToggleRed,
          onValueChanged: (index)
          {
            setState(() {
              historyOfPseudomonas == 1?isPneumonic = null:isPneumonic = index;

              isPneumonic == null && isSevere == null?penicillinAllergy = penicillinAllergy: isPneumonic == 1 || isSevere == 1? penicillinAllergy = 0:penicillinAllergy = null;

              penicillinAllergy == null? allergyType = null: penicillinAllergy == 1|| penicillinAllergy == 0?allergyType = allergyType: allergyType = null;

            });


            notifyParent();

          },

          ),

      toggleBox3: YesNoToggleSwitchScoring(
          title: '3. History of Pseudomonas?',
          indexPosition: historyOfPseudomonas,
          switchColour: kHighlightedToggleRed,
          onValueChanged: (index)
          {
            setState(() {

              historyOfPseudomonas = index;

              if(historyOfPseudomonas == 1)
              {
                isSevere = null;
                isPneumonic = null;
              }
              else
              {
                isSevere = 0;
                isPneumonic = 0;
              }

              historyOfPseudomonas == 1 || isSevere == 1 || isPneumonic == 1?penicillinAllergy = 0:penicillinAllergy = null;

              penicillinAllergy == null? allergyType = null: penicillinAllergy == 1|| penicillinAllergy == 0?allergyType = allergyType: allergyType = null;

            });

            notifyParent();



          },
          ),

      toggleBox4: YesNoToggleSwitchScoring(
          title: "4. Allergic to Penicillin?",
          indexPosition: penicillinAllergy,
          switchColour: kHighlightedToggleRed,
          onValueChanged: (index)
          {
            setState(() {
              isSevere == 1||isPneumonic ==1||historyOfPseudomonas ==1?penicillinAllergy = index:penicillinAllergy = null;

              penicillinAllergy == 1?allergyType = 0: allergyType = null;
            });

            notifyParent();
          },
          ),

      penicillinToggle: PenicillinSlider(
        indexPosition: allergyType,
        switchColour: kHighlightedToggleRed,
        onValueChanged: (index)
        {

          setState(() {
            penicillinAllergy == 1?allergyType = index: allergyType = null;
          });
          notifyParent();

        },
        ),

    );
  }
}
