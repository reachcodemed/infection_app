import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class PaedsTonsillitis extends StatefulWidget {
  @override
  _PaedsTonsillitisState createState() => _PaedsTonsillitisState();
}

class _PaedsTonsillitisState extends State<PaedsTonsillitis> {

  String antibioticTextOutput = "Please enter an age and weight for the child";
  String inputAge = "";
  String inputWeight = "";
  int? isMonthsYears = 0;
  int? isExudate;
  int? isFever;
  int? isTenderLymph;
  int? isCough;
  int?  isPenicillinAllergic;


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
        pageTitle: "Tonsillitis",
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

        toggleBox3: YesNoToggleBasic(
            title: "3. Exudate",
            indexPosition: isExudate,
            onValueChanged: (index)
            {
              setState(() {
                isExudate = index;
              });
            },
            switchColour: kHighlightedToggleYellow,
            
        ),

        toggleBox4: YesNoToggleBasic(
            title:'4. Fever',
            indexPosition: isFever,
            onValueChanged: (index)
        {
          setState(() {
            isFever = index;
          });
        },
        switchColour: kHighlightedToggleYellow,),
        toggleBox5: YesNoToggleBasic(
            title: "5. Tender Lymph Nodes",
            indexPosition: isTenderLymph,
            onValueChanged: (index)
          {
            setState(() {
              isTenderLymph = index;
            });
          },
          switchColour: kHighlightedToggleYellow,),
        toggleBox6: YesNoToggleBasic(
            title: "6. Lack of Cough",
            indexPosition: isCough,
          onValueChanged: (index)
          {
            setState(() {
              isCough = index;
            });
          },
          switchColour: kHighlightedToggleYellow,),


        toggleBox7: YesNoToggleBasic(
            title: '7. Penicillin Allergy?',
            indexPosition: isPenicillinAllergic,
          onValueChanged: (index)
          {
            setState(() {
              isPenicillinAllergic = index;
            });
          },
          switchColour: kHighlightedToggleYellow,),



        antibioticTextOutput: antibioticTextOutput,),
    );


  }
}

