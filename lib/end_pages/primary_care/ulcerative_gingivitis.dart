import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class GPUlcerativeGingivitis extends StatefulWidget {
  const GPUlcerativeGingivitis({Key? key}) : super(key: key);

  @override
  _GPUlcerativeGingivitisState createState() => _GPUlcerativeGingivitisState();
}

class _GPUlcerativeGingivitisState extends State<GPUlcerativeGingivitis> {

  int? isSystemic = 0;

  List <String> antibioticTextInput =
  [
    """Topical: Chlorhexidine 0.12-0.2% (do not use within 30 minus of toothpaste)

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
      if(isSystemic == 0)
        {
          antibioticTextOutput = antibioticTextInput[0];
        }
      else if (isSystemic == 1)
        {
          antibioticTextOutput = antibioticTextInput[1];
        }
      else
        {
          antibioticTextOutput = "Select Options";
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
      pageTitle: "Acute Nectoritising Ulcerating Gingivitis",
      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        boxColour: kPaedsDropDownBlue,
        textInput: 'Refer to dentist for scaling and hygiene advice. Antiseptic mouthwash if pain limits oral hygiene. Commence Metronidazole if systemic signs and symptoms',
      ),

      toggleBox1: YesNoToggleBasic(
          title: '1. Systemic signs/symptoms?',
          indexPosition: isSystemic,
          switchColour: kHighlightedToggleYellow,
          onValueChanged: (index)
      {
        setState(() {
          isSystemic = index;
          notifyParent();
        });

      }),

    );
  }
}
