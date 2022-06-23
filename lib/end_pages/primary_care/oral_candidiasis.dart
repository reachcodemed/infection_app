import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class GPOralCandidiasis extends StatefulWidget {
  const GPOralCandidiasis({Key? key}) : super(key: key);

  @override
  _GPOralCandidiasisState createState() => _GPOralCandidiasisState();
}

class _GPOralCandidiasisState extends State<GPOralCandidiasis> {

  String antibioticTextOutput = """First line: Topical: Miconazole oromucosal gel

Adults: 2.5ml of 24mg/ml (20mg/g) QDS (hold in mouth/retain near oral lesions before swallowing) (to be administered after food)

Children: Please refer to BNFC

Duration: 7 days, then continue for 7 days after resolved


Second line: If Miconazole is not tolerated:

Topical: Nystatin suspension 1ml; 100,000 units/ml QDS (half each side)

Duration: 7 days and continued for 48 hours after lesions have resolved


Third line: Oral: Fluconazole 

Adults: 50mg OD (100mg OD in HIV/immunocompromised)

Children: Please refer to the BNFC
""";



  @override
  Widget build(BuildContext context) {
    return ClassicEndPage(
      topPanelColour: kPrimaryCareOrange,
      pageTitle: "Oral Candidiasis",
      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        boxColour: kPaedsDropDownBlue,
        height: 130,
        textInput: 'Acute pseudomembranous candidiasis (thrush), is usually an acute infection but may persist for months when recieving infhaled corticosteroids, cytotoxics or broad-spectrum antibacterials. Oral candidiasis is rare in immunocompetent adults; consider undiagnosed risk factors including HIV',
      ),


    );
  }
}
