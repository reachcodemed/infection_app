import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class PaedsHealthyPeritonitis extends StatefulWidget {
  @override
  _PaedsHealthyPeritonitisState createState() => _PaedsHealthyPeritonitisState();
}

class _PaedsHealthyPeritonitisState extends State<PaedsHealthyPeritonitis> {

  String antibioticTextOutput = "Please enter an age and weight for the child";
  String inputAge = "";
  String inputWeight = "";
  int? isMonthsYears = 0;
  List<bool> isPenicillinAllergic = [true,false];
  List<bool> allergyType = [true,false];

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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ClassicEndPage(
        pageTitle: "Peritonitis Healthy Child",
        topPanelColour: kPaediatricOrange,

        toggleBox1: AgeToggleSwitchPaeds(title: '1. Age',
            onChanged: (input)
            {
              inputAge = input;
            },
          indexPosition: isMonthsYears,
          onValueChanged:(index)
          {
            setState(() {
              isMonthsYears = index;
            });

          },
          switchColour: kHighlightedToggleYellow,),
        toggleBox2: WeightOrHeightEntryPaeds(
            title: '2. Weight',
            fieldText: TextEditingController(),

            onChanged: (input)
            {
              inputWeight = input;
            }),

        toggleBox3: YesNoToggleSwitchBasic(
            title: '3. Penicillin Allergy?',
            indexPosition: isPenicillinAllergic,
            switchColour: kHighlightedToggleYellow,
            notifyParent: notifyParent),

        penicillinToggle: PenicillinToggle(
            boxColour: kPaedsPenicillinPurple,
            switchColour: kHighlightedToggleYellow,
            isPenicillinAllergic: isPenicillinAllergic[1],
            notifyParent: notifyParent,
            isSelected: allergyType),


        antibioticTextOutput: antibioticTextOutput,),
    );


  }
}

