import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class GPMucosalInflammation extends StatefulWidget {
  const GPMucosalInflammation({Key? key}) : super(key: key);

  @override
  _GPMucosalInflammationState createState() => _GPMucosalInflammationState();
}

class _GPMucosalInflammationState extends State<GPMucosalInflammation> {


  String antibioticTextOutput = """First line: simple saline mouthwash

Rinse mouth with  ½ teaspoon salt dissolved in a glass of warm water

Second line: 

Topical: Chlorhexidine 0.12-0.2% (do not use within 30 minus of toothpaste)

Adults: Rinse mouth with 10 ml BD for about 1 minute at a time

Children: Please refer to BNFC

OR

Topical: Hydrogen peroxide 6%

Adults: Rinse mouth with 15ml diluted in ½ glass warm water for 2-3 minutes BD-TDS

Children: Please refer to BNFC
""";


  notifyParent()
  {
    setState(() {

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notifyParent();
  }

  @override
  Widget build(BuildContext context) {
    return ClassicEndPage(
        topPanelColour: kPrimaryCareOrange,
        pageTitle: "Mucosal Ulceration & Inflammation",
        antibioticTextOutput: antibioticTextOutput,

        topRedBox: TopRedInfoBox(
          boxColour: kPaedsDropDownBlue,
          textInput: 'The primary cause for mucosal ulceration or inflammation (aphthous ulcers; oral lichen planus; herpes simplex infection; oral cancer) needs to be evaluated and treated.',
        ),


    );
  }
}
