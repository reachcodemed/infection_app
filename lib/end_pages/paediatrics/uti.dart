import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class PaedsUTI extends StatefulWidget {
  @override
  _PaedsUTIState createState() => _PaedsUTIState();
}

class _PaedsUTIState extends State<PaedsUTI> {

  String antibioticTextOutput = "Please enter an age and weight for the child";
  String inputAge = "";
  String inputWeight = "";
  int? isMonthsYears = 0;
  int? isPenicillinAllergic = 0;
  int? allergyType = 0;

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
        pageTitle: "Lower Tact & Temperature >38",
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
            fieldText: TextEditingController(),
            title: '2. Weight',

            onChanged: (input)
            {
              inputWeight = input;
            }),

        toggleBox4: YesNoToggleBasic(
          switchColour: kHighlightedToggleYellow,
          title: '3. Allergic to Penicillin?',
          indexPosition: isPenicillinAllergic,

          onValueChanged: (index)
          {

            setState(()
            {
              isPenicillinAllergic = index;
              isPenicillinAllergic == 1?allergyType = 0:allergyType = null;
            });

          },
        ),
        penicillinToggle: PenicillinSlider(
          boxColour: kPaedsPenicillinPurple,
          switchColour: kHighlightedToggleYellow,
          indexPosition: allergyType,
          onValueChanged: (index)
          {

            setState(() {
              if (isPenicillinAllergic == 1)
              {
                allergyType = index;
              }
              else
              {
                allergyType = null;
              }

            });


          },
        ),


        antibioticTextOutput: antibioticTextOutput,),
    );


  }
}

