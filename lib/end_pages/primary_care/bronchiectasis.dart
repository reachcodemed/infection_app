import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class GPBronchiectasis extends StatefulWidget {
  const GPBronchiectasis({Key? key}) : super(key: key);

  @override
  _GPBronchiectasisState createState() => _GPBronchiectasisState();
}

class _GPBronchiectasisState extends State<GPBronchiectasis> {

  String antibioticTextOutput = "Select Options";
  int? isPenicillinAllergic = 0;
  int? isPregnant = 0;
  int? isHighRisk = 0;


  List <String> antibioticTextInput = [
    """Adult: Doxycycline 200mg OD on the first day, then 100mg OD

Children: Not for use in children <12 years of age

OR 

Adults: Amoxicillin 500mg TDS

Children: please refer to BNFC

Duration: 5 days

""",
    """Adult: Doxycycline 200mg OD on the first day, then 100mg OD

Children: Not for use in children <12 years of age

OR 

Adult: Clarithromycin 500mg BD

Children: Please refer to BNFC

Duration: 7-14 days

""",
    """ Adult: Amoxicillin 500mg TDS

Duration: 7-14 days

""",
    """Adult: Co-amoxiclav 625mg TDS

Children: Please refer to BNFC

OR

Adult: Levofloxacin 500mg OD

Children: Please refer to BNFC

OR

Adult: Ciprofloxacin 500mg BD

Children: Please refer to BNFC

Duration: 5 days

""",
    """Adult: Erythromycin 250-500mg QDS or 500-1000mg BD

Duration: 5 days  

""",
    """ Adult: Co-amoxiclav 625mg TDS

Duration: 7-14 days

""",
    """Adult: Levofloxacin 500mg OD

OR 

 Ciprofloxacin 500mg BD

Children: please refer to BNFC

Duration: 7-14 days
""",
    """Adult: Erythromycin 250-500mg QDS or 500-1000mg BD

Duration: 5 days  

""",

  ];

  notifyParent()
  {
    if(isHighRisk == 0)
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
          antibioticTextOutput = antibioticTextInput[4];
        }
      }
    }
    else
    {
      if(isPregnant == 0)
      {
        if(isPenicillinAllergic == 0)
        {
          antibioticTextOutput = antibioticTextInput[3];
        }
        else
        {
          antibioticTextOutput = antibioticTextInput[6];
        }
      }
      else
      {
        if(isPenicillinAllergic == 0)
        {
          antibioticTextOutput = antibioticTextInput[5];
        }
        else
        {
          antibioticTextOutput = antibioticTextInput[7];
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
      pageTitle: "Bronchiectasis Acute Exacerbation",
      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        boxColour: kPaedsDropDownBlue,
        height: 175,
        textInput: "An acute exacerbation of bronchiectasis is a sustained worsening of symptoms from a person's stable state.\n\n•Send a sputum sample for culture and susceptibility testing\n•Offer an antibiotic - take account of:\n   • the severity of symptoms\n   • previous exacerbations, hospitalisations\n   • risk of complications\n   • previous sputum culture and susceptibility results",
      ),


      toggleBox1: YesNoToggleBasic(
          title: '1. Allergic to Penicillin?',
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
          title: '2. Patient Pregnant?',
          indexPosition: isPregnant,
          switchColour: kHighlightedToggleYellow,
        onValueChanged: (index)
        {
          setState(() {
            isPregnant = index;
            notifyParent();
          });
        },),

      toggleBox3: YesNoToggleBasic(
          title: '3. Higher risk of treatment failure?',
          indexPosition: isHighRisk,
          switchColour: kHighlightedToggleYellow,
        onValueChanged: (index)
        {
          setState(() {
            isHighRisk = index;
            notifyParent();
          });
        },),


    );
  }
}
