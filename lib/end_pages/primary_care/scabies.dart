import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class GPScabies extends StatefulWidget {
  const GPScabies({Key? key}) : super(key: key);

  @override
  _GPScabiesState createState() => _GPScabiesState();
}

class _GPScabiesState extends State<GPScabies> {

  String antibioticTextOutput = """First line: Permethrin 5% cream

Second line: Malathion 0.5% aqueous liquid

Apply once weekly for 2 doses, then wash off after 8-12 hours. If hands are washed with soap within 8 hours of application, they should be treated again with cream

""";

  @override
  Widget build(BuildContext context) {
    return ClassicEndPage(
      topPanelColour: kPrimaryCareOrange,
      pageTitle: "Scabies",

      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        boxColour: kPaedsDropDownBlue,
        height: 120,
        textInput: 'First choice permethrin: Treat whole body from ear/chin downwards, and under nails. If using permethrin and patient is under 2 years, elderly or immunosuppressed, or if treating with malathion: also treat face and scalp. Treat all home and sexual contacts: treat within 24 hours',
      ),




    );
  }
}
