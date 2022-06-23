import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class GPOtitisExterna extends StatefulWidget {
  const GPOtitisExterna({Key? key}) : super(key: key);

  @override
  _GPOtitisExternaState createState() => _GPOtitisExternaState();
}

class _GPOtitisExternaState extends State<GPOtitisExterna> {

  String antibioticTextOutput = """OTC for adults:

Ear spay: Acetic acid 2%, (EarCalm® spray)

Adults and children >12: 2 drops TDS and after swimming/showering/bathing. Maximum dosage frequency one spay every 2-3 hours

Duration: 7 days max, as excessive use may result in fungal infections

OR 

First line: Ear drops: Betamethasone sodium phosphate 0.1%, Neomycin sulfate 0.5% (Betnesol-N ear/eye/nose drops)

Adults and children: 2-3 drops TDS-QDS

Duration: 7-14 days

Second line: Ear spray: Neomycin sulfate 0.5%, Acetic acid glacial 2%, Dexamethasone 0.1% (Otomize® Ear spray)

Adults and children: 1 spay TDS

Duration 7-14 days
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
      pageTitle: "Acute Otitis Externa",
      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        boxColour: kPaedsDropDownBlue,
        textInput: 'In the first instance avoid antibiotic, analgesia for pain relief, self care advice and apply localised heat (such as warm flannel). Subsequently consider topical acetic acid/topical antibiotic with or without a topical corticosteroid',
      ),




    );
  }
}
