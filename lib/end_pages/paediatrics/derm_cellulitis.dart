import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class PaedsDermCellulitis extends StatefulWidget {
  @override
  _PaedsDermCellulitisState createState() => _PaedsDermCellulitisState();
}

class _PaedsDermCellulitisState extends State<PaedsDermCellulitis> {

  String antibioticTextOutput = "Please enter an age and weight for the child";
  String inputAge = "";
  String inputWeight = "";
  int? isMonthsYears = 0;
  int? isPenicillinAllergic = 0;
  int? diseaseSeverity = 0;

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
        pageTitle: "Cellulitis",
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

        toggleBox3: YesNoToggleBasic(
          switchColour: kHighlightedToggleYellow,
          title: '3. Allergic to Penicillin?',
          indexPosition: isPenicillinAllergic,

          onValueChanged: (index)
          {

            setState(()
            {
              isPenicillinAllergic = index;
            });

          },
        ),


        toggleBox4: ToggleSwitchTriple(
            title: "4. Severity",
            firstText: 'Mild',
            secondText: 'Moderate',
            thirdText: 'Severe',
            switchColour: kHighlightedToggleYellow,
            indexPosition: diseaseSeverity,
            onValueChanged: (index)
        {
          setState(() {
            diseaseSeverity = index;
          });
        }),


        antibioticTextOutput: antibioticTextOutput,),
    );


  }
}

