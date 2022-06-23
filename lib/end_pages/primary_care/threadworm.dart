import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class GPThreadworm extends StatefulWidget {
  const GPThreadworm({Key? key}) : super(key: key);

  @override
  _GPThreadwormState createState() => _GPThreadwormState();
}

class _GPThreadwormState extends State<GPThreadworm> {

  String antibioticTextOutput = """Oral: Mebendazole 

Not licenced for use in children under 2 years

Adults and children > 6 months: 100mg for 1 dose; if re-infection occurs, second dose may be needed after 2 weeks

Children under 6 months OR pregnant (first trimester): hygiene measure only for at least 6 weeks


""";

  @override
  Widget build(BuildContext context) {
    return ClassicEndPage(
      topPanelColour: kPrimaryCareOrange,
      pageTitle: "Threadworm",
      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        boxColour: kPaedsDropDownBlue,
        height: 120,
        textInput: 'Treat all household contacts at the same time. Advise hygiene measures for 2 weeks (hand hygiene; pants at night;morning shower, including perianal area). Wash sleepwear, bed linen, and dust and vacuum. Child <6 months, add perianal wet wiping or washes 3 hourly.',
      ),


    );
  }
}
