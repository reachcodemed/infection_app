import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class GPImpetigo extends StatefulWidget {
  const GPImpetigo({Key? key}) : super(key: key);

  @override
  _GPImpetigoState createState() => _GPImpetigoState();
}

class _GPImpetigoState extends State<GPImpetigo> {

  String antibioticTextOutput = """Topical: Fusidic acid 2% cream thinly TDS

Duration: 5 days
""";


  @override
  Widget build(BuildContext context) {
    return ClassicEndPage(
      topPanelColour: kPrimaryCareOrange,
      pageTitle: "Impetigo",

      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        boxColour: kPaedsDropDownBlue,
        textInput: 'Reserve topical antibiotics for very localised lesions to reduce risk of bacteria becoming resistant. Only use mupirocin if cause by MRSA. Extensive, severe, or bullous: treat with oral antibiotics.',
      ),


    );
  }
}
