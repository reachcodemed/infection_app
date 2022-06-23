import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class GPRecurrentUTI extends StatefulWidget {
  const GPRecurrentUTI({Key? key}) : super(key: key);

  @override
  _GPRecurrentUTIState createState() => _GPRecurrentUTIState();
}

class _GPRecurrentUTIState extends State<GPRecurrentUTI> {

  String antibioticTextOutput = "Select Options";
  int? isFirstLine = 0;
  int? penicillinAllergic = 0;
  int? allergyType;


  List <String> antibioticTextInput = [
    """Prophylaxis Oral: Trimethoprim (avoid in pregnancy)

Adult: 200mg STAT when exposed to a trigger or 100mg ON

Children: Please refer to BNFC

OR 

 Nitrofurantoin (if eGFR >45ml/min)

Adult: 100mg STAT when exposed to a trigger or 50-100mg ON

Children: Please refer to BNFc

Duration: Review within 6 months
""",
    """Prophylaxis Oral: Trimethoprim (avoid in pregnancy)

Adult: 200mg STAT when exposed to a trigger or 100mg ON

Children: Please refer to BNFC

OR 

 Nitrofurantoin (if eGFR >45ml/min)

Adult: 100mg STAT when exposed to a trigger or 50-100mg ON

Children: Please refer to BNFc

Duration: Review within 6 months
""",
    """Prophylaxis Oral: Trimethoprim (avoid in pregnancy)

Adult: 200mg STAT when exposed to a trigger or 100mg ON

Children: Please refer to BNFC

OR 

 Nitrofurantoin (if eGFR >45ml/min)

Adult: 100mg STAT when exposed to a trigger or 50-100mg ON

Children: Please refer to BNFc

Duration: Review within 6 months
""",
    """Prophylaxis Oral: Amoxicillin 

Adult: 500mg STAT when exposed to trigger OR 250mg ON

Children:
Child: 3-11 months 62.5mg ON
Child: 1-4 years 125mg ON
Child: 5-15 years 250mg ON

OR Cefalexin  

Adult: 500mg STAT when exposed to trigger OR 125mg ON 

Children: 
Child: 3 months - 15 years 12.5mg/kg ON (max 125mg)

Duration: Review within 6 months
""",
    """Prophylaxis Oral: Cefalexin 

Adult: 500mg STAT when exposed to trigger OR 125mg ON 

Children: 
Child: 3 months - 15 years 12.5mg/kg ON (max 125mg)

Duration: Review within 6 months
""",
    """Discuss with Consultant Microbiologist
""",

  ];

  notifyParent()
  {
    if(isFirstLine == 0)
      {
        if(penicillinAllergic == 0)
          {
            antibioticTextOutput = antibioticTextInput[0];
          }
        else
          {
            if(allergyType == 1)
              {
                antibioticTextOutput = antibioticTextInput[1];
              }
            else
              {
                antibioticTextOutput = antibioticTextInput[2];
              }
          }
      }
    else
      {
        if(penicillinAllergic == 0)
        {
          antibioticTextOutput = antibioticTextInput[3];
        }
        else
        {
          if(allergyType == 1)
          {
            antibioticTextOutput = antibioticTextInput[4];
          }
          else
          {
            antibioticTextOutput = antibioticTextInput[5];
          }
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
      pageTitle: "Catheter-Associated Infection",
      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        boxColour: kPaedsDropDownBlue,
        textInput: 'Recurrent UTI includes lower and upper UTI and may be due to relapse (same strain of bacteria) or reinfection (different strain or species of bacteria)',
      ),

      toggleBox1: DoubleSwitchFullWidth(
          indexPosition: isFirstLine,
          firstText: "First Line",
          secondText: "Second Line",
          onValueChanged: (index)
      {
        setState(() {
          isFirstLine = index;
          notifyParent();
        });
      }),

      toggleBox2: YesNoToggleBasic(
        switchColour: kHighlightedToggleYellow,
        title: 'Allergic to Penicillin?',
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
