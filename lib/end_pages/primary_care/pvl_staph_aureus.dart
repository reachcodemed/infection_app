import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class GPPVLsAureus extends StatefulWidget {
  const GPPVLsAureus({Key? key}) : super(key: key);

  @override
  _GPPVLsAureusState createState() => _GPPVLsAureusState();
}

class _GPPVLsAureusState extends State<GPPVLsAureus> {

  String antibioticTextOutput = """Suppression therapy should only be started after primary infection has resolved, as suppression therapy is ineffective if lesions are still leaking.

Risk factors for PVL: if there is more than one case in a home or close community (children; military personnel; nursing home residents; household contacts); recurrent skin infections; invasive infections; men who have sex with men; close sports contacts.

Consider taking a swab of pus from the contents of the lesion if the boil or carbuncle is:

• Not responding to treatment, persistent or recurrent, to exclude atypical mycobacteria or PVL-SA
• There are multiple lesions
• The person: is immunosuppressed, is known to be colonized with MRSA, has diabetes
• If PVL-SA is suspected, this should be mentioned specifically on the laboratory form
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
      pageTitle: "PVL-Staphylococcus aureus",

      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        boxColour: kPaedsDropDownBlue,
        textInput: 'Panton-Valentine leukocidin (PVL) is a toxin produced by 20.8 - 46% of S.aureus from boils/abscesses. The toxin destroys white blood cells. PVL strains are rare in healthy people but severe.',
      ),




    );
  }
}
