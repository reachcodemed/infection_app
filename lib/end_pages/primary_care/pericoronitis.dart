import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class GPPericoronitis extends StatefulWidget {
  const GPPericoronitis({Key? key}) : super(key: key);

  @override
  _GPPericoronitisState createState() => _GPPericoronitisState();
}

class _GPPericoronitisState extends State<GPPericoronitis> {

  int? isPenicillinAllergic = 0;

  List <String> antibioticTextInput =
  [
    """Adults: Amoxicillin 500mg PO TDS

Children: please refer to the BNFC

Duration 3 days

Topical: Chlorhexidine 0.12-0.2% (do not use within 30 minus of toothpaste)

Adults: Rinse mouth with 10 ml BD for about 1 minute at a time

Children: Please refer to BNFC

OR

Topical: Hydrogen peroxide 6%

Adults: Rinse mouth with 15ml diluted in ½ glass warm water for 2-3 minutes BD-TDS

Children: Please refer to BNFC
""",
    """Adults: Metronidazole 400mg PO TDS for 3 days

Children: Metronidazole for 3 days PO (please refer to BNFC for dosing)

Also topical: Chlorhexidine 0.12-0.2% (do not use within 30 minus of toothpaste)

Adults: Rinse mouth with 10 ml BD for about 1 minute at a time

Children: Please refer to BNFC

OR

Topical: Hydrogen peroxide 6%

Adults: Rinse mouth with 15ml diluted in ½ glass warm water for 2-3 minutes BD-TDS

Children: Please refer to BNFC
""",

  ];

  String antibioticTextOutput = "Select Options";


  notifyParent()
  {
    if(isPenicillinAllergic == 0 )
      {
        antibioticTextOutput = antibioticTextInput[0];
      }
    else
      {
        antibioticTextOutput = antibioticTextInput[1];
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
      pageTitle: "Pericoronitis",
      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        boxColour: kPaedsDropDownBlue,
        textInput: 'Refer to dentish for irrigation or debridement. If persistent swelling or systemic symptoms use metronidazole or amoxicillin. Use antiseptic mouthwash if pain and trismus limit oral hygiene.',
      ),

      toggleBox1: YesNoToggleBasic(
          title: '1. Allergic to Penicillin',
          indexPosition: isPenicillinAllergic,
          switchColour: kHighlightedToggleYellow,
          onValueChanged: (index)
        {
          setState(() {
            isPenicillinAllergic = index;
            notifyParent();
          });
        },),


    );
  }
}
