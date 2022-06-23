import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class GPScarletFever extends StatefulWidget {
  const GPScarletFever({Key? key}) : super(key: key);

  @override
  _GPScarletFeverState createState() => _GPScarletFeverState();
}

class _GPScarletFeverState extends State<GPScarletFever> {

  String antibioticTextOutput = "Select Options";
  int? isPenicillinAllergic = 0;
  int? isPregnant = 0;


  List<String> antibioticTextInput = [
    """ Oral Phenoxymethylpenicillin 

Adult: 500mg QDS

Children:

Neonates: 12.5 mg/kg (max 62.5mg) QDS
Child: 1-11 months 62.5mg QDS
Child: 1-5 years 125mg QDS
Child: 6-11 years 250mg QDS
Child: 12-17 years 250-500mg QDS

Duration: 10 days

""",
    """Oral Clarithromycin 

Adult: 250-500mg BD

Children:

<8kg 7.5mg/kg BD
Child: 8-11kg 62.5mg BD
Child: 12-19kg 125mg BD
Child: 20-29kg 187.5 BD 
Child: 30-40kg 250mg BD
Child: 12-17 years 250-500mg BD

Duration 10 days

""",
    """Oral Phenoxymethylpenicillin 

Adult: 500mg QDS

Duration: 10 days

""",
    """Oral Erythromycin 250-500mg QDS or 500-1000mg BD 

Duration: 5 days

"""
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
        antibioticTextOutput = antibioticTextInput[1];
      }
    }
    else
    {
      if(isPenicillinAllergic == 0)
      {
        antibioticTextOutput = antibioticTextInput[2];
      }
      else
      {
        antibioticTextOutput = antibioticTextInput[3];
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
      pageTitle: "Scarlet Fever",
      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        boxColour: kPaedsDropDownBlue,
        textInput: 'Prompt treatment with appropriate antibiotics significantly reduces the risk of complications. Optimise analgesia and give safety netting advice',
      ),

      toggleBox1: YesNoToggleBasic(
        title: '1. Allergic to penicillin?',
        indexPosition: isPenicillinAllergic,
        switchColour: kHighlightedToggleYellow,
        onValueChanged: (index)
        {
          setState(() {
            isPenicillinAllergic = index;
            notifyParent();
          });
        },),


      toggleBox2: YesNoToggleBasic(
          title: '2. Pregnant?',
          indexPosition: isPregnant,
          switchColour: kHighlightedToggleYellow,
          onValueChanged: (index)
          {
            setState(() {
              isPregnant = index;
              notifyParent();
            });
          }),

    );
  }
}
