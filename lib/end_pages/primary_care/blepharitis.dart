import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class GPBlepharitis extends StatefulWidget {
  const GPBlepharitis({Key? key}) : super(key: key);

  @override
  _GPBlepharitisState createState() => _GPBlepharitisState();
}

class _GPBlepharitisState extends State<GPBlepharitis> {
  
  String antibioticTextOutput = """If indicated: 

First line: Topical Chloramphenicol 1% ointment

Adults and children: Apply twice daily for a 6 week trial

Second line: Oral Oxytetracycline  

Adults: 500mg BD (initial) for 4 weeks then 250mg BD (maintenance) 8 weeks

Children: Please refer to BNFC

OR 

Oral Doxycycline 

Adults: 200mg once only (first day) followed by 100 mg OD for 5-7 days
""";

  @override
  Widget build(BuildContext context) {
    return ClassicEndPage(
      topPanelColour: kPrimaryCareOrange,
      pageTitle: "Blepharitis",
      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        boxColour: kPaedsDropDownBlue,
        textInput: 'First instance: lid hygiene for symptom control, including: warm compresses; lid massage and scribs; gentle washing; avoiding cosmetics. Topic antibiotics if hygiene measures are ineffective after 2 weeks.',
      ),


    );
  }
}
