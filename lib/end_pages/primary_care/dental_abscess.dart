import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class GPDentalAbscess extends StatefulWidget {
  const GPDentalAbscess({Key? key}) : super(key: key);

  @override
  _GPDentalAbscessState createState() => _GPDentalAbscessState();
}

class _GPDentalAbscessState extends State<GPDentalAbscess> {

  int? isPenicillinAllergic = 0;
  int? isSevere = 0;

  List <String> antibioticTextInput =
  [
    """Adults: Amoxicillin 500mg-1000mg PO TDS

Children: Please refer to BNFC

OR 

Adults: Phenoxymethylpenicillin 500-1000mg PO QDS

Children: Please refer to BNFC

Duration up to 5 days, review at day 3
""",
    """Adults: Clarithromycin 500mg BD

Children: Please refer to BNFC

Duration up to 5 days, review at day 3
""",
    """Adults: Amoxicillin 500mg-1000mg PO TDS
+ Metronidazole 400mg PO TDS 

Children: Please refer to BNFC

OR 

Adults: Phenoxymethylpenicillin 500-1000mg PO QDS

Children: Please refer to BNFC

Duration up to 5 days, review at day 3
""",
    """Adults: Clarithromycin 500mg BD
+ Metronidazole 400mg PO TDS 

Children: Please refer to BNFC

Duration up to 5 days, review at day 3
""",
  ];

  String antibioticTextOutput = "Select Options";


  notifyParent()
  {
   if(isSevere == 0)
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
      pageTitle: "Dental Abscess",
      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        boxColour: kPaedsDropDownBlue,
        textInput: 'If pus is present, refer for drainage, tooth extraction or root canal. Send pus for investigation. If spreading infection (lymph node involvement or systemic signs, that is, fever or malaise) add metronidazole',
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

      }),
      toggleBox2: PenicillinSlider(
          boxColour: kPaedsDropDownBlue,
          switchColour: kHighlightedToggleYellow,
          titleText: "Severity",
          firstText: "Non Severe",
          secondText: "Severe",
          onValueChanged: (index)
          {
            setState(() {
              isSevere = index;
              notifyParent();
            });
          },
          indexPosition: isSevere)

    );
  }
}
