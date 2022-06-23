import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class GPMRSATreatment extends StatefulWidget {
  const GPMRSATreatment({Key? key}) : super(key: key);

  @override
  _GPMRSATreatmentState createState() => _GPMRSATreatmentState();
}

class _GPMRSATreatmentState extends State<GPMRSATreatment> {

  String antibioticTextOutput = """ Doxycycline alone 100mg BD

OR

 Trimethoprim 200mg BD

Duration: 7 days
""";

  @override
  Widget build(BuildContext context) {
    return ClassicEndPage(
        topPanelColour: kPrimaryCareOrange,
        pageTitle: "MRSA Treatment",

        antibioticTextOutput: antibioticTextOutput,

        topRedBox: TopRedInfoBox(
          boxColour: kPaedsDropDownBlue,
          textInput: 'Do not use clindamycin. For active MRSA infection, confirmed by lab results. Use sensitivities to guide treatment. If severe infection or no response to monotherapy, seek advice from microbiologist on combination therapy and use of Linezolid.',
        ),




    );
  }
}
