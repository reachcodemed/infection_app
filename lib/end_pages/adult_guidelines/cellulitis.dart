import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/custom_widgets.dart';

class AdultCellulitis extends StatefulWidget {
  const AdultCellulitis({Key? key}) : super(key: key);

  @override
  _AdultCellulitisState createState() => _AdultCellulitisState();
}

class _AdultCellulitisState extends State<AdultCellulitis> {

  int? isSevere = 0;
  int? penicillinAllergic = 0;


  List <String> antibioticTextInput =
  [
    'ANTIBIOTIC TEXT 1',
    'ANTIBIOTIC TEXT 2',
    'ANTIBIOTIC TEXT 3',
    'ANTIBIOTIC TEXT 4',
  ];

  String antibioticTextOutput = "Select Options";

  @override
  Widget build(BuildContext context) {
    return ClassicEndPage(
      pageTitle: "Cellulitis/Phlebitis",
      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        textInput: 'Draw demarcation lines, send wound swabs and check for previous MRSA results',
      ),

      toggleBox1: YesNoToggleBasic(
          title: '1. Severe/systemically unwell?',
          indexPosition: isSevere,

        onValueChanged: (index)
        {
          setState(()
          {
            isSevere= index;
          });
        },),
      toggleBox2: YesNoToggleBasic(
          title: '2. Allergic to penicillin?',
          indexPosition: penicillinAllergic,

        onValueChanged: (index)
        {
          setState(()
          {
            penicillinAllergic = index;
          });

        },),

    );
  }
}