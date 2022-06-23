import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class GPSinusitis extends StatefulWidget {
  const GPSinusitis({Key? key}) : super(key: key);

  @override
  _GPSinusitisState createState() => _GPSinusitisState();
}

class _GPSinusitisState extends State<GPSinusitis> {

  String antibioticTextOutput = "Select Options";
  int? isPenicillinAllergic = 0;
  int? isPregnant = 0;


  List<String> antibioticTextInput = [
    """ Phenoxymethylpenicillin 

Adults: 500mg QDS

Children:  please review BNFC

Duration: 5 days

Second line or first choice if systemically very unwell or high risk of complications: Oral: Co-amoxiclav PO

Adults: 625mg TDS

Children: please review BNFC

Duration: 5 days

""",
    """Oral Clarithromycin 

Adult: 250-500mg BD

Children: please review BNFC

Duration: 5 days

OR

 Doxycycline 200mg once only on first day, then 100mg OD (not to be used in children under 12 or in pregnancy)

Duration: 5 days

""",
    """ Phenoxymethylpenicillin 

Adults: 500mg QDS

Children:  please review BNFC

Duration: 5 days

Second line or first choice if systemically very unwell or high risk of complications: Oral: Co-amoxiclav PO

Adults: 625mg TDS

Children: please review BNFC

Duration: 5 days


""",
    """Adult: Erythromycin 250-500mg QDS or 500-1000mg BD 

Children: please review BNFC
Duration: 5-7 days

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
      pageTitle: "Acute Sinusitis",
      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        boxColour: kPaedsDropDownBlue,
        textInput: 'Bacterial cause more likely if several of the following present: symptoms for more than 10 days, discoloured or purulent nasal discharge, severe localised unilateral pain (particularly pain over the teeth and jaw), fever, marked deterioration after initial milder phase',
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
