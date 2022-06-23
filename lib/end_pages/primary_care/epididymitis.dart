import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class GPEpididymitis extends StatefulWidget {
  const GPEpididymitis({Key? key}) : super(key: key);

  @override
  _GPEpididymitisState createState() => _GPEpididymitisState();
}

class _GPEpididymitisState extends State<GPEpididymitis> {

  String antibioticTextOutput = """Oral: Doxycycline 100mg OD

Duration: 10-14 days

OR

Oral Ofloxacin 200-400mg BD (consider safety issues)

Duration: 14 days

OR 

Oral: Ciprofloxacin 500mg BD (consider safety issues)

Duration: 10 days
""";


  @override
  Widget build(BuildContext context) {
    return ClassicEndPage(
      topPanelColour: kPrimaryCareOrange,
      pageTitle: "Epididymitis",
      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        boxColour: kPaedsDropDownBlue,
        textInput: 'Usually due to Gram-negative enteric bacteria in men over 35 years with low risk of STI. If under 35 years or STI risk, refer to GUM',
      ),


    );
  }
}
