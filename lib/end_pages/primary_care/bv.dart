import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class GPBV extends StatefulWidget {
  const GPBV({Key? key}) : super(key: key);

  @override
  _GPBVState createState() => _GPBVState();
}

class _GPBVState extends State<GPBV> {

  String antibioticTextOutput = """First line: Oral Metronidazole 400mg BD

Duration: 7 days

OR 

Oral Metronidazole 2g STAT (not recommended in pregnancy)

Second line: Topical Metronidazole 0.75% vaginal gel 5g applicator at night

Duration: 5 nights

OR

Topical Clindamycin 2% cream 5g applicator at night

Duration: 7 nights
""";

  @override
  Widget build(BuildContext context) {
    return ClassicEndPage(
      topPanelColour: kPrimaryCareOrange,
      pageTitle: "Bacterial Vaginosis",
      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        boxColour: kPaedsDropDownBlue,
        textInput: 'Oral Metronidazole is as effective as topical treatment, and is cheaper. 7 days results in fewer relapses than 2g stat at 4 weeks. Treating partners does not reduce relapse. Pregnant/breastfeeding: avoid 2g dose.',
      ),


    );
  }
}
