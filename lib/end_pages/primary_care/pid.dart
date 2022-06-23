import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class GPPID extends StatefulWidget {
  const GPPID({Key? key}) : super(key: key);

  @override
  _GPPIDState createState() => _GPPIDState();
}

class _GPPIDState extends State<GPPID> {

  String antibioticTextOutput = """First line: Metronidazole 400mg TDS

+ Ofloxacin 400mg BD

OR 

+ Moxifloxacin 400mg OD

Duration: 14 days

Gonorrhoea suspected: IM CefTRIAXone 500mg STAT (unless anaphylaxis to penicillin, in which case discuss with on-call GUM Consultant)
+ Metronidazole 400mg TDS
+ Doxycycline 100mg BD

Duration: 14 days
""";


  @override
  Widget build(BuildContext context) {
    return ClassicEndPage(
      topPanelColour: kPrimaryCareOrange,
      pageTitle: "Pelvic Inflammatory Disease",
      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        boxColour: kPaedsDropDownBlue,
        textInput: 'Refer women and sexual contacts to GUM. Excluse: ectopic pregnancy, appendicitis, endometriosis, UTI, irritable bowel, complicated ovarian cyst, functional pain. Always culture for gonorrhoea and chlamydia, and test for Mycoplasma genitalium',
      ),


    );
  }
}
