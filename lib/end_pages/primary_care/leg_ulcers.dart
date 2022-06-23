import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class GPLegUlcers extends StatefulWidget {
  const GPLegUlcers({Key? key}) : super(key: key);

  @override
  _GPLegUlcersState createState() => _GPLegUlcersState();
}

class _GPLegUlcersState extends State<GPLegUlcers> {

  String antibioticTextOutput = "Select Options";
  int? isPenicillinAllergic = 0;


  List<String> antibioticTextInput = [
    """Adult: Flucloxacillin 500mg QDS

Children: please refer to BNFC

Duration: 7 days; if slow response continue for a further 5 days


""",
    """Adult: Clarithromycin 500mg BD

Children: please refer to BNFC

Duration: 7 days; if slow response continue for a further 5 days

""",
  ];


  notifyParent()
  {
    if(isPenicillinAllergic == 0)
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
      pageTitle: "Leg Ulcers",

      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        boxColour: kPaedsDropDownBlue,
        textInput: 'Ulcers are always colonised. Antibiotics do not improve healing unless active infection (only conisder if purulent exudate/odour; increased pain; cellulitis; pyrexia). MRSA colonised/or infected discuss with microbiologist',
      ),

      toggleBox1: YesNoToggleBasic(
          title: '1. Allergic to Penicillin?',
          indexPosition: isPenicillinAllergic,
          switchColour: kHighlightedToggleYellow,
          onValueChanged: (index)
        {
          setState(() {
            isPenicillinAllergic = index;
            notifyParent();
          });
        },),


    );
  }
}
