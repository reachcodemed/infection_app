import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class GPMRSADecolonisation extends StatefulWidget {
  const GPMRSADecolonisation({Key? key}) : super(key: key);

  @override
  _GPMRSADecolonisationState createState() => _GPMRSADecolonisationState();
}

class _GPMRSADecolonisationState extends State<GPMRSADecolonisation> {

  String antibioticTextOutput = "Select Options";
  int? isResistant = 0;



  List<String> antibioticTextInput = [
    """First line: Topical: 2% Mupirocin nasal ointment (Bactroban®). Apply pea-sized amounts to the inner surface of each nostril using a cotton wool bud. Apply TDS.

Duration: 5 days

Skin topical antiseptic wash, 4% Chlorhexidine Gluconate (Hibiscrub®) antiseptic detergent. Moisten skin and apply undiluted antiseptic detergent to all areas in the place of soap, leave for 3 minutes then rise. Apply daily.

Duration: 5 days


""",
    """First line: Topical: Chlorhexidine Hydrochloride 0.1% + Neomycin Sulphate (Naseptin®) 0.5% nasal cream (NB avoid in patients with peanut allergy). Apply pea-sized amounts to the inner surface of each nostril using a cotton wool bud. Apply QDS.

Duration: 10 days

Skin topical antiseptic wash, 4% Chlorhexidine Gluconate (Hibiscrub®) antiseptic detergent. Moisten skin and apply undiluted antiseptic detergent to all areas in the place of soap, leave for 3 minutes then rise. Apply daily.

Duration: 5 days


""",
  ];


  notifyParent()
  {
    if(isResistant == 0)
    {
      antibioticTextOutput = antibioticTextInput[0];
    }
    else
    {
      antibioticTextOutput = antibioticTextInput[1];
    }
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
      pageTitle: "MRSA Decolonisation",

      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        boxColour: kPaedsDropDownBlue,
        textInput: 'GPs may be asked to screen and decolonise patients e.g. a patient elects to have surgery outside their area. GPs should not be routinely asked to screen patients attending Croydon University Hospital',
      ),

      toggleBox1: DoubleSwitchFullWidth(
          indexPosition: isResistant,
          firstText: 'Mupirocin sensitive',
          secondText: 'Mupirocin resistant',
          onValueChanged: (index)
      {
        setState(() {
          isResistant = index;
          notifyParent();
        });
      })




    );
  }
}
