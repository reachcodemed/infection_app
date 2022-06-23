import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class GPTrichomoniasis extends StatefulWidget {
  const GPTrichomoniasis({Key? key}) : super(key: key);

  @override
  _GPTrichomoniasisState createState() => _GPTrichomoniasisState();
}

class _GPTrichomoniasisState extends State<GPTrichomoniasis> {

  String antibioticTextOutput = """First line: 

 Metronidazole 400mg BD

Duration: 5-7 days

OR 

 Metronidazole 2g STAT once only (dose associated with more adverse effects)
""";

  @override
  Widget build(BuildContext context) {
    return ClassicEndPage(
      topPanelColour: kPrimaryCareOrange,
      pageTitle: "Trichomoniasis",
      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        boxColour: kPaedsDropDownBlue,
        height: 120,
        textInput: 'Oral treatment needed as extravainal infection is common. Treat partners, and refer to GUM. If pregnant/breastfeeding: avoid 2g single dose of metronidazole. Offer Clotrimazole for symptom relief (not cure) if metronidazole declined/contraindicated.',
      ),


    );
  }
}
