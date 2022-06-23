import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class GPAcuteProstatitis extends StatefulWidget {
  const GPAcuteProstatitis({Key? key}) : super(key: key);

  @override
  _GPAcuteProstatitisState createState() => _GPAcuteProstatitisState();
}

class _GPAcuteProstatitisState extends State<GPAcuteProstatitis> {

  String antibioticTextOutput = """First line: To be guided by susceptibilities when available:

Oral: Ciprofloxacin 500mg BD (consider safety issues)

OR

Oral: Ofloxacin 200mg BD (consider safety issues)

OR 

Oral: Trimethoprim 200mg BD (if unable to take quinolone) (off label use)

Second line: After discussion with a specialist:

Oral: Levofloxacin 500mg OD (consider safety issues) 

OR

Oral: Co-trimoxazole 960mg BD (consider safety issues)

Duration: 14 days and then review
""";


  notifyParent()
  {
    setState(() {

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
      topPanelColour: kPrimaryCareOrange,
      pageTitle: "Acute Prostatitis",
      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        boxColour: kPaedsDropDownBlue,
        textInput: 'Offer antibiotic and send a midstream urine sample for culture and susceptibility testing. Usual course of acute prostatitis is several weeks',
      ),



    );
  }
}
