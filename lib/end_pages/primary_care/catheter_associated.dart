import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class GPCatheterAssociated extends StatefulWidget {
  const GPCatheterAssociated({Key? key}) : super(key: key);

  @override
  _GPCatheterAssociatedState createState() => _GPCatheterAssociatedState();
}

class _GPCatheterAssociatedState extends State<GPCatheterAssociated> {

  String antibioticTextOutput = "Select Options";
  int? isUpperUTI = 0;
  int? penicillinAllergic = 0;
  int? category = 0;
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
    return ClassicEndPage(
      topPanelColour: kPrimaryCareOrange,
      pageTitle: "Catheter-Associated Infection",
      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        boxColour: kPaedsDropDownBlue,
        textInput: 'Antibiotic treatment is not routinely needed for asymptomatic bacteruria in people with a urinary catheter. (All catheters are colonised with organisms within 48 hours on insertion)',
      ),

      toggleBox1: TripleSwitchFullWidth(
          firstText: 'Adult',
          secondText: 'Pregnant',
          thirdText: 'Child > 3/12',
          indexPosition: category,
          onValueChanged: (index)
      {
        setState(() {
          category = index;
        });
      }),

      toggleBox2: DoubleSwitchFullWidth(
          indexPosition: isUpperUTI,
          firstText: "No Upper UTI Symptoms",
          secondText: "Upper UTI Symptoms",
          onValueChanged: (index)
      {
        setState(() {
          isUpperUTI = index;
        });
      }),

      toggleBox3: YesNoToggleBasic(
        switchColour: kHighlightedToggleYellow,
        title: 'Allergic to Penicillin?',
        indexPosition: penicillinAllergic,

        onValueChanged: (index)
        {

          setState(()
          {
            penicillinAllergic = index;
            penicillinAllergic == 1?allergyType = 0:allergyType = null;
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

          });


        },
      ),


    );
  }
}
