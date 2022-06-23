import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class GPOtitisMedia extends StatefulWidget {
  const GPOtitisMedia({Key? key}) : super(key: key);

  @override
  _GPOtitisMediaState createState() => _GPOtitisMediaState();
}

class _GPOtitisMediaState extends State<GPOtitisMedia> {

  String antibioticTextOutput = "Select Options";
  int? isPenicillinAllergic = 0;
  int? isPregnant = 0;


  List<String> antibioticTextInput = [
    """ Amoxicillin 

Adults: 500mg QDS

Children:  please review BNFC

Duration: 5-7 days

Second line or worsening symptoms with first line for at least 2-3 days: Co-amoxiclav PO

Adults: 625mg TDS

Children: please review BNFC

Duration: 5 days

""",
    """Oral Clarithromycin 

Adult: 250-500mg BD

Children: please review BNFC

Duration: 5-7 days

""",
    """ Amoxicillin 

Adults: 500mg QDS

Children:  please review BNFC

Duration: 5-7 days

Second line or worsening symptoms with first line for at least 2-3 days: Co-amoxiclav PO

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
      pageTitle: "Acute Otitis Media",
      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        boxColour: kPaedsDropDownBlue,
        textInput: 'Optimise analgesia and avoid antibiotics. Those with otorrhoea, or those ages less than 2 years with bilateral infection are more likely to benefit from antibiotics',
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
