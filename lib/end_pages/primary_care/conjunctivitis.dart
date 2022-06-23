import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class GPConjunctivitis extends StatefulWidget {
  const GPConjunctivitis({Key? key}) : super(key: key);

  @override
  _GPConjunctivitisState createState() => _GPConjunctivitisState();
}

class _GPConjunctivitisState extends State<GPConjunctivitis> {

  String antibioticTextOutput = """First line: If severe, topical Chloramphenicol 0.5% eye drop (can be purchased OTC)

Adults and children > 1 month old: Apply 1 drop to the effect eye every 2 hours then reduce the frequency as infection is controlled to 3-4 times daily and continue for 48 hours after resolution

Or 

Topical: Chloramphenicol 1% ointment

Adults and children > 1 month old: apply daily, at night and continue for 48 hours after resolution. (Avoid in pregnancy, breast feeding and neonates unless essential)

Second line: Topical Fusidic Acid 1% modified release eye drops (high cost)

Adults and children: apply twice daily and continue for 48 hours after resolution
""";


  @override
  Widget build(BuildContext context) {
    return ClassicEndPage(
      topPanelColour: kPrimaryCareOrange,
      pageTitle: "Conjunctivitis",
      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        boxColour: kPaedsDropDownBlue,
        textInput: 'First line: bath/clean eyelids with cotton wool dipped in sterile saline or boiled (cooled) water, to remove crusting. Reassure that most cases of acute, infectious conjunctivitis are self limiting and do not reuqire antibiotics.',
      ),


    );
  }
}
