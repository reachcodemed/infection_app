import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class PaedsLateSepsis extends StatefulWidget {
  @override
  _PaedsLateSepsisState createState() => _PaedsLateSepsisState();
}

class _PaedsLateSepsisState extends State<PaedsLateSepsis> {

  String antibioticTextOutput = "Please enter an age and weight for the child";
  String inputAge = "";
  String inputWeight = "";
  int? isPenicillinAllergic = 0;


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
        pageTitle: "Late onset sepsis < 72 hours",
        topPanelColour: kPaediatricOrange,

        toggleBox1: WeightOrHeightEntryPaeds(
            fieldText: TextEditingController(),
            title: '1. Age',
            units: "days",
            onChanged: (input)
            {
              inputWeight = input;
            }),

        toggleBox2: WeightOrHeightEntryPaeds(
            fieldText: TextEditingController(),
            title: '2. Weight',
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



        antibioticTextOutput: antibioticTextOutput,),
    );


  }
}

