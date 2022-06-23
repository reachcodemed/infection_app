import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class GPCDiff extends StatefulWidget {
  const GPCDiff({Key? key}) : super(key: key);

  @override
  _GPCDiffState createState() => _GPCDiffState();
}

class _GPCDiffState extends State<GPCDiff> {

  int? occurrence = 0;
  int? isSevere = 0;
  String antibioticTextOutput = "Select Options";
  double minWidthOfToggles = 80;

  List <String> antibioticTextInput =
  [
    """Adults: Metronidazole 400mg PO TDS

Children: Metronidazole - please refer to the BNFC

Duration: 10-14 days
""",
    """Adults: Vancomycin 125mg PO QDS

Children: Vancomycin - please refer to the BNFC

Duration: 10-14 days then taper (e.g. 125mg QDS for 10-14 days followed by 125mg BD for 7 days then 125mg OD for 7 days then stop)
""",
    """Adults: Vancomycin 125mg PO QDS

Children: Vancomycin - please refer to the BNFC

Duration: 10-14 days then taper (e.g. 125mg QDS for 10-14 days followed by 125mg BD for 7 days then 125mg OD for 7 days then stop)
""",
    """Adults: Fidaxomicin 200mg PO BD

Children: Please refer to the BNFC

Duration 10 days
""",
  ];

  notifyParent()
  {
    if(occurrence == 0)
      {
        if (isSevere == 0 )
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
        if (isSevere == 0 )
        {
          antibioticTextOutput = antibioticTextInput[2];
        }
        else
        {
          antibioticTextOutput = antibioticTextInput[3];
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
      pageTitle: "Clostridium difficile",
      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        boxColour: kPaedsDropDownBlue,
        textInput: 'Review need for any antibiotics prescribed and antiperistaltic agents and discontinue where possible. Mild cases (<4 episodes of stool/day) may respond without Metronidazole',
      ),

      toggleBox1: CustomTextDoubleSwitch(
          minWidth: minWidthOfToggles,
          title: '1. Occurrence?',
          indexPosition: occurrence,
          onValueChanged: (index)
          {
            setState((){
              occurrence = index;
              notifyParent();
            });
          },
          switchColour: kHighlightedToggleYellow,
          firstText: "First",
          secondText: "Recurrent"),

      toggleBox2: CustomTextDoubleSwitch(
          minWidth: minWidthOfToggles,
          title: '2. Severity?',
          indexPosition: isSevere,
          onValueChanged: (index)
          {
            setState(() {
              isSevere = index;
              notifyParent();
            });
          },
          switchColour: kHighlightedToggleYellow,
          firstText: 'Non Severe',
          secondText: 'Severe'),


    );
  }
}
