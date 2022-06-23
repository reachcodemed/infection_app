import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class PaedsMeningoencephalitis extends StatefulWidget {
  @override
  _PaedsMeningoencephalitisState createState() => _PaedsMeningoencephalitisState();
}

class _PaedsMeningoencephalitisState extends State<PaedsMeningoencephalitis> {

  String antibioticTextOutput = "Please enter an age and weight for the child";
  String inputAge = "";
  String inputWeight = "";
  String inputHeight = "";
  int? isMonthsYears = 0;
  int? isPenicillinAllergic = 0;
  int? allergyType = null;

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
        pageTitle: "Meningo-encephalitis",
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

        toggleBox3: WeightOrHeightEntryPaeds(
            fieldText: TextEditingController(),
            title: '3. Height',
            units: "cm",
            onChanged: (input)
            {
              inputHeight = input;
            }),


        toggleBox4: YesNoToggleBasic(
          switchColour: kHighlightedToggleYellow,
          title: '4. Allergic to Penicillin?',
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

