import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class PaedsEarlySepsis extends StatefulWidget {
  @override
  _PaedsEarlySepsisState createState() => _PaedsEarlySepsisState();
}

class _PaedsEarlySepsisState extends State<PaedsEarlySepsis> {

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
        pageTitle: "Early onset sepsis < 72 hours",
        topPanelColour: kPaediatricOrange,

        toggleBox1: const Padding(
          padding: EdgeInsets.only(bottom: 20.0),
          child: Text('Please note that this child is <72h old',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,)),
        ),
        toggleBox2: WeightOrHeightEntryPaeds(
            fieldText: TextEditingController(),
            title: '1. Weight',
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

            });

        },
        ),
        


        antibioticTextOutput: antibioticTextOutput,),
    );


  }
}

