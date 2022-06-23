import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class GPDermatophyteSkin extends StatefulWidget {
  const GPDermatophyteSkin({Key? key}) : super(key: key);

  @override
  _GPDermatophyteSkinState createState() => _GPDermatophyteSkinState();
}

class _GPDermatophyteSkinState extends State<GPDermatophyteSkin> {

  int? isFirstLine = 0;
  String antibioticTextOutput = "Select Options";

  List <String> antibioticTextInput =
  [
    """Topical: Terbinafine 1% cream. Apply thinly OD-BD

Duration: 1-2 weeks then review
""",
    """Topical: Imidazole e.g. Clotrimazole 1% cream, apply BD or TDS

OR 

For athlete’s foot only - topical: Undecanoaetes (Mycota®) apply BD

Duration: Continue use for 7 days after lesions have healed, therefore typically for a total of 4-6 weeks
""",
    """Adult: oral Terbinafine 250mg OD

Children: please refer to BNFC

Duration: 4-6 weeks 

OR

Adult: oral Itraconazole 100mg OD

Children: please refer to BNFC

Duration: 15 days then review
""",
  ];

  void notifyParent()
  {
    if(isFirstLine == 0)
      {
        antibioticTextOutput = antibioticTextInput[0];
      }
    else if (isFirstLine == 1)
      {
        antibioticTextOutput = antibioticTextInput[1];
      }
    else
      {
        antibioticTextOutput = antibioticTextInput[2];
      }
  }

  @override
  Widget build(BuildContext context) {
    return ClassicEndPage(
      pageTitle: "Dermatophyte Skin",
      topPanelColour: kPrimaryCareOrange,
      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        height: 120,
        textInput: 'Most cases: use topical terbinafine as fungicidal, treatment time shorter than with fungistatic imidazoles. If candida possible, use imidazole. If intractable, or scalp: send skin scrapings, and if infection confirmed: use oral terbinafine or itraconazole.',
        boxColour: kPaedsDropDownBlue,
      ),

      toggleBox1: TripleSwitchFullWidth(
          firstText: 'First Line',
          secondText: 'SecondLine',
          thirdText: 'Intractable/scalp',
          indexPosition: isFirstLine,
          onValueChanged: (index)
      {
        setState(() {
          isFirstLine = index;
          notifyParent();
        });

      }),


    );
  }
}