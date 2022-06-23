import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class GPDermatophyteNail extends StatefulWidget {
  const GPDermatophyteNail({Key? key}) : super(key: key);

  @override
  _GPDermatophyteNailState createState() => _GPDermatophyteNailState();
}

class _GPDermatophyteNailState extends State<GPDermatophyteNail> {

  int? isFirstLine = 0;

  List <String> antibioticTextInput =
  [
    """Adult: Oral Terbinafine 250mg OD

Children: please refer to BNFC

Duration: fingers: 6 weeks; toes: 12 weeks 
""",
    """Adult: Oral Itraconazole 200mg BD for 7 days per month

Children: please refer to BNFC

Duration: fingers: 2 courses; toes: 3 courses

""",
  ];

  String antibioticTextOutput = "Select Options";


  notifyParent()
  {
    if (isFirstLine == 0)
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
      pageTitle: "Dermatophyte Nail",
      topPanelColour: kPrimaryCareOrange,
      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        textInput: 'Take nail clippings; start therapy only if infection is confirmed. Oral terbinafine is more effective than oral azole. If candida or non-dermatophyte infection is confirmed, used oral itraconzaole.',
        boxColour: kPaedsDropDownBlue,
      ),

      toggleBox1: DoubleSwitchFullWidth(
          firstText: 'First Line',
          secondText: 'SecondLine',
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