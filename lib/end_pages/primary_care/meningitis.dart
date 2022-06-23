import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class GPMeningitis extends StatefulWidget {
  const GPMeningitis({Key? key}) : super(key: key);

  @override
  _GPMeningitisState createState() => _GPMeningitisState();
}

class _GPMeningitisState extends State<GPMeningitis> {

  String antibioticTextOutput = "Select Options";
  int? penicillinAllergic = 0;
  int? allergyType = null;

  List<String>antibioticTextInput = [
    """IV/IM Benzylpenicillin 1.2g STAT, adults and children >10 years

Children: 1-9 years 600mg, <1 years 300mg 
""",
    """Do not give IV antibiotics - refer to secondary care immediately""",
    """IV/IM CefOTAXime 500mg STAT, adults and children >12 years

Children: 50mg/kg (max 3g)
""",

  ];

  notifyParent()
  {
    if(penicillinAllergic == 0)
      {
        antibioticTextOutput = antibioticTextInput[0];
      }
    else
      {
        if(allergyType == 0)
          {
            antibioticTextOutput = antibioticTextInput[1];
          }
        else
          {
            antibioticTextOutput = antibioticTextInput[2];
          }
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
      pageTitle: "Meningitis",
      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        boxColour: kPaedsDropDownBlue,
        textInput: 'Transfer all patients to hospital immediately. If time before hospital admission, and non-blanching rash, give IV Benzylpenicillin or Cefotaxime',
      ),

      toggleBox1: YesNoToggleBasic(
        switchColour: kHighlightedToggleYellow,
        title: '1. Allergic to Penicillin?',
        indexPosition: penicillinAllergic,

        onValueChanged: (index)
        {

          setState(()
          {
            penicillinAllergic = index;
            penicillinAllergic == 1?allergyType = 0:allergyType = null;
            notifyParent();
          });

        },
      ),
      penicillinToggle: PenicillinSlider(
        boxColour: kPaedsDropDownBlue,
        switchColour: kHighlightedToggleYellow,
        indexPosition: allergyType,
        onValueChanged: (index)
        {

          setState(() {
            if (penicillinAllergic == 1)
            {
              allergyType = index;
            }
            else
            {
              allergyType = null;
            }
            notifyParent();
          });


        },
      ),




    );
  }
}
