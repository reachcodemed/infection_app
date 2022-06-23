import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';
import 'package:flutter/material.dart';

class CovidAntimicrobialGuidance extends StatefulWidget {
  @override
  _CovidAntimicrobialGuidanceState createState() => _CovidAntimicrobialGuidanceState();
}

class _CovidAntimicrobialGuidanceState extends State<CovidAntimicrobialGuidance> {

  String antibioticTextOutput = "Please select all the options";

  List <String> antibioticTextInput = [
    """ Amoxicillin 1g PO TDS (or IV 2g TDS)
± Doxycycline 200mg PO OD
Or Clarithromycin 500mg BD IV if not absorbing/tolerating PO
""",
    """ Doxycycline 200mg PO OD
Or Clarithromycin 500mg BD IV if not absorbing/tolerating PO
    """,
    """ Piperacillin-Tazobactam 4.5g IV TDS
± Doxycycline 200mg PO OD
Or Clarithromycin 500mg BD IV if not absorbing/tolerating PO
""",
    """ Levofloxacin 500mg IV/PO BD
""",
    """ Ceftriaxone 2g IV OD
± Doxycycline 200mg PO OD
Or Clarithromycin 500mg BD IV if not absorbing/tolerating PO
""",
    """ Doxycycline 200mg OD
""",
    """ Co-amoxiclav 625mg PO TDS (1.2g IV TDS if not absorbing/able to swallow)
""",
    """ Levofloxacin 500mg IV/PO BD
""",
    """ Piperacillin-Tazobactam 4.5g IV TDS
""",
    """ Ciprofloxacin 400mg IV BD
+ Linezolid 500mg IV PO BD
""",
    """ Ceftazidime 2g IV TDS
""",



  ];

  int? onset = null;
  int? severity = null;
  int? penicillinAllergy = null;
  int? allergyType = null;

  notifyParent()
  {
    setState(() {

      if (onset == 0)
        {
          if (severity == 0)
            {
              if(penicillinAllergy == 0)
              {
                antibioticTextOutput = antibioticTextInput[0];
              }
              else if(penicillinAllergy ==1 && allergyType ==0)
              {
                antibioticTextOutput = antibioticTextInput[1];
              }
              else if(penicillinAllergy == 1 && allergyType ==1)
              {
                antibioticTextOutput = antibioticTextInput[1];
              }
            }
          else if (severity == 1)
            {
              if(penicillinAllergy == 0)
              {
                antibioticTextOutput = antibioticTextInput[2];
              }
              else if(penicillinAllergy ==1 && allergyType ==0)
              {
                antibioticTextOutput = antibioticTextInput[3];
              }
              else if(penicillinAllergy == 1 && allergyType ==1)
              {
                antibioticTextOutput = antibioticTextInput[4];
              }
            }
          else if (severity == 2)
            {
              if(penicillinAllergy == 0)
              {
                antibioticTextOutput = antibioticTextInput[2];
              }
              else if(penicillinAllergy ==1 && allergyType ==0)
              {
                antibioticTextOutput = antibioticTextInput[3];
              }
              else if(penicillinAllergy == 1 && allergyType ==1)
              {
                antibioticTextOutput = antibioticTextInput[4];
              }
            }
        }

      else if (onset == 1)
        {
          if (severity == 0)
          {
            if(penicillinAllergy == 0)
            {
              antibioticTextOutput = antibioticTextInput[5];
            }
            else if(penicillinAllergy ==1 && allergyType ==0)
            {
              antibioticTextOutput = antibioticTextInput[5];
            }
            else if(penicillinAllergy == 1 && allergyType ==1)
            {
              antibioticTextOutput = antibioticTextInput[5];
            }
          }
          else if (severity == 1)
          {
            if(penicillinAllergy == 0)
            {
              antibioticTextOutput = antibioticTextInput[6];
            }
            else if(penicillinAllergy ==1 && allergyType ==0)
            {
              antibioticTextOutput = antibioticTextInput[7];
            }
            else if(penicillinAllergy == 1 && allergyType ==1)
            {
              antibioticTextOutput = antibioticTextInput[7];
            }
          }
          else if (severity == 2)
          {
            if(penicillinAllergy == 0)
            {
              antibioticTextOutput = antibioticTextInput[8];
            }
            else if(penicillinAllergy ==1 && allergyType ==0)
            {
              antibioticTextOutput = antibioticTextInput[9];
            }
            else if(penicillinAllergy == 1 && allergyType ==1)
            {
              antibioticTextOutput = antibioticTextInput[10];
            }
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
        toggleBox1: CustomTextDoubleSwitch(
            title: "Onset?",
            minWidth: 90,
            indexPosition: onset,
            onValueChanged: (index)
        {
          setState(() {
            onset = index;
          });
          notifyParent();
        },
            firstText: "Community",
            secondText: "Hospital",
            switchColour: kCovidPaleMaroon),


        toggleBox2: ToggleSwitchTriple(
            title: "Severity?",
            indexPosition: severity,
            onValueChanged: (index)
            {
              setState(() {
                severity = index;
              });
              notifyParent();
            },
            firstText: "Mild",
            secondText: "Moderate",
            thirdText: "Severe",
            switchColour: kCovidPaleMaroon),


        toggleBox3: YesNoToggleBasic(
            title: "Allergic to Penicillin?",
            indexPosition: penicillinAllergy,
            switchColour: kCovidPaleMaroon,
            onValueChanged: (index)
            {
              setState(()
              {
                penicillinAllergy = index;
                penicillinAllergy == 1?allergyType = 0:allergyType = null;
              });
              notifyParent();
            },),

        penicillinToggle: PenicillinSlider(
          boxColour:kCovidPaleMaroon,
          switchColour: kCovidPaleMaroon,
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
            notifyParent();
          },
        ),

        topPanelColour: kCovidMaroon,
        pageTitle: "Antimicrobial Guidance",
        antibioticTextOutput: antibioticTextOutput);
  }
}
