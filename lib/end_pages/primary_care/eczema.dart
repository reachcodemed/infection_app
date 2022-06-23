import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class GPEczema extends StatefulWidget {
  const GPEczema({Key? key}) : super(key: key);

  @override
  _GPEczemaState createState() => _GPEczemaState();
}

class _GPEczemaState extends State<GPEczema> {

  String antibioticTextOutput = "Select Options";
  int? isPenicillinAllergic = 0;


  List<String> antibioticTextInput = [
    """Adult: Flucloxacillin 1000mg QDS

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
  Widget build(BuildContext context) {
    return ClassicEndPage(
      topPanelColour: kPrimaryCareOrange,
      pageTitle: "Eczema",

      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        boxColour: kPaedsDropDownBlue,
        textInput: 'No visible signs of infection: No antibiotics indicated - antibiotic use (alone or with steroids) encourages resistance and dose not improve healing.',
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
