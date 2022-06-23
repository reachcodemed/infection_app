import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class GPCellulitis extends StatefulWidget {
  const GPCellulitis({Key? key}) : super(key: key);

  @override
  _GPCellulitisState createState() => _GPCellulitisState();
}

class _GPCellulitisState extends State<GPCellulitis> {

  String antibioticTextOutput = "Select Options";
  int? location = 0;
  int? isPenicillinAllergic = 0;

  List <String> antibioticTextInput = [
    """Adult: Flucloxacillin 1g QDS

Children: please refer to BNFC

Duration: 7 days; if slow response continue for another 7 days
""",
    """Adult: Co-amoxiclav 625mg TDS

Children: please refer to BNFC

Duration: 7 days; if slow response continue for another 7 days
""",
    """Adult: Doxycycline 100mg BD

Children: please discuss with On-call Microbiologist

Duration: 7 days; if slow response, continue for a further 7 days
""",
    """Adult: Doxycycline 100mg BD or Clarithromycin 500mg BD

Children: please refer to BNFC

Duration: 7 days; if slow response continue for another 7 days
""",


    """Please discuss with on-call Microbiologist""",


    """Adult: Doxycycline 100mg BD

Children: please discuss with on-call Microbiologist

Duration: 7 days; if slow response, continue for a further 7 days
""",
  ];

  notifyParent()
  {
    if(isPenicillinAllergic == 0)
      {
        if (location == 0)
          {
            antibioticTextOutput = antibioticTextInput[0];
          }
        else if (location == 1)
          {
            antibioticTextOutput = antibioticTextInput[1];
          }
        else
          {
            antibioticTextOutput = antibioticTextInput[2];
          }
      }
    else
      {
        if (location == 0)
        {
          antibioticTextOutput = antibioticTextInput[3];
        }
        else if (location == 1)
        {
          antibioticTextOutput = antibioticTextInput[4];
        }
        else
        {
          antibioticTextOutput = antibioticTextInput[5];
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
      pageTitle: "Cellulitis/Erysipelas",
      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        boxColour: kPaedsDropDownBlue,
        textInput: 'Class I: Patient afebrile and healthy - flucloxacillin alone. Class II: Patient febrile and ill, or comorbidity, admit for IV treatment, or use OPAT. Class III: Systemically ill - admit. Adding clindamycin does not improve outcomes',
      ),

      
      toggleBox1: YesNoToggleBasic(
          title: '1. Allergic to Penicillin?',
          switchColour: kHighlightedToggleYellow,
          indexPosition: isPenicillinAllergic,
          onValueChanged: (index)
        {
          setState(() {
            isPenicillinAllergic = index;
            notifyParent();
          });
        },),

      toggleBox2: TripleSwitchFullWidth(
          indexPosition: location,
          firstText: 'Cellulitis',
          secondText: 'Face',
          thirdText: 'MRSA in last 24/12',
          onValueChanged: (index)
        {
          setState(() {
            location = index;
            notifyParent();
          });
        },),




    );
  }
}
