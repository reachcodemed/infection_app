import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class PaedsBrainAbscess extends StatefulWidget {
  @override
  _PaedsBrainAbscessState createState() => _PaedsBrainAbscessState();
}

class _PaedsBrainAbscessState extends State<PaedsBrainAbscess> {

  String antibioticTextOutput = "Please enter an age and weight for the child";
  String inputAge = "";
  String inputWeight = "";
  int? isMonthsYears = 0;
  int? isPenicillinAllergic = 0;
  int? allergyType = null;
  int? tripleSwitch = 0;

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
        pageTitle: "Brain Abscess/Empyema",
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
              isPenicillinAllergic == 1?allergyType = 0:allergyType = null;
            });

          },
        ),
        toggleBox4: Column(
          children: [
            PenicillinSlider(
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
            SizedBox(height: 15,),
          ],
        ),


        toggleBox5: TripleSwitchFullWidth(
            indexPosition: tripleSwitch,
            onValueChanged: (index)
          {
            setState(() {
              tripleSwitch = index;
            });
          },
            firstText: "Healthy",
            secondText: "CNS Disease",
            thirdText: "Immunosuppressed",



        ),

        antibioticTextOutput: antibioticTextOutput,),


    );


  }
}

