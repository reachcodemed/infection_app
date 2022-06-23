import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class GPDiabeticFoot extends StatefulWidget {
  const GPDiabeticFoot({Key? key}) : super(key: key);

  @override
  _GPDiabeticFootState createState() => _GPDiabeticFootState();
}

class _GPDiabeticFootState extends State<GPDiabeticFoot> {

  String antibioticTextOutput = "Select Options";
  int? isPenicillinAllergic = 0;

  List<String> antibioticTextInput = [
    """Adult: Co-amoxiclav 625mg TDS and discuss with a specialist

Duration: 7 days and then review
""",
    """Adult: Doxycycline 100mg BD and discuss with a specialist

Duration: 7 days and then review
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
      pageTitle: "Diabetic Foot/Leg Ulcer",

      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        boxColour: kPaedsDropDownBlue,
        height: 120,
        textInput: 'Swab for culture and refer if moderate/severe or unresolved infection. Clinical signs of infection may be masked in a diabetic - low threshold for antibiotic use, especially in someone with a neuroischaemic ulcer. If MRSA positive discuss with Microbiology',
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
