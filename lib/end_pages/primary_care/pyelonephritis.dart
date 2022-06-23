import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class GPPyelonephritis extends StatefulWidget {
  const GPPyelonephritis({Key? key}) : super(key: key);

  @override
  _GPPyelonephritisState createState() => _GPPyelonephritisState();
}

class _GPPyelonephritisState extends State<GPPyelonephritis> {

  String antibioticTextOutput = "Select Options";
  int? isPenicillinAllergic = 0;
  int? isPregnant = 0;
  int? allergyType = null;

  List<String> antibioticTextInput = [
    """Oral: CefALEXin 

Adult: 500mg BD or TDS (up to 1g to 1.5g TDS or QDS for severe infections)

Children: 12.5mg/kg BD (25mg/kg BD-QDS - max 1g QDS for severe infections)

OR Oral: Co-amoxiclav 

Adult: 625mg TDS

Children: 

3-11 months 0.25ml/kg or 125/31 TDS
1-5 years 5ml of 125/31 TDS
6-11 years 5ml of 250/62 TDS

Duration: 7-10 days

OR (>15 years) Oral: Trimethoprim (only if sensitive) 200mg BD

Duration: 14 days 

OR Oral Ciprofloxacin 500mg BD
Duration 7 days

""",
    """(>15 years) Oral: Trimethoprim (only if sensitive) 200mg BD

Duration: 14 days 

OR 

Oral Ciprofloxacin 500mg BD

Duration: 7 days

""",
    """ NEEDS UPDATING
""",
    """Oral: CefALEXin 

Adult: 500mg BD or TDS (up to 1g to 1.5 g TDS or QDS for severe infections)

Duration: 7-10 days

Second choice antibiotics or combining antibiotics if susceptibility or sepsis is a concern, consult a local microbiologist

""",
    """Consult local Microbiologist

""",
    """Oral: CefALEXin 

Adult: 500mg BD or TDS (up to 1g to 1.5 g TDS or QDS for severe infections)

Duration: 7-10 days

Second choice antibiotics or combining antibiotics if susceptibility or sepsis is a concern, consult a local microbiologist

""",
  ];

  void notifyParent()
  {
    if(isPregnant == 0)
    {
      if(isPenicillinAllergic == 0)
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
    else
    {
      if(isPenicillinAllergic == 0)
      {
        antibioticTextOutput = antibioticTextInput[3];
      }
      else
      {
        if(allergyType == 0)
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
      pageTitle: "Acute Pyelonephritis",
      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        boxColour: kPaedsDropDownBlue,
        textInput: 'Send a midstream urine sample for culture and susceptibility testing. Advise paracetamol (± low dose weak opioid) for pain for people over 12 and offer antibiotic',
      ),

      toggleBox1: YesNoToggleBasic(
          title: '1. Pregnant?',
          indexPosition: isPregnant,
          switchColour: kHighlightedToggleYellow,
          onValueChanged: (index)
        {
          setState(() {
            isPregnant = index;
            notifyParent();
          });
        },),

      toggleBox2: YesNoToggleBasic(
        switchColour: kHighlightedToggleYellow,
        title: '2. Allergic to Penicillin?',
        indexPosition: isPenicillinAllergic,

        onValueChanged: (index)
        {

          setState(()
          {
            isPenicillinAllergic = index;
            isPenicillinAllergic == 1?allergyType = 0:allergyType = null;
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
            if (isPenicillinAllergic == 1)
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
