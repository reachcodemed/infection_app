import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class GPGenitalHerpes extends StatefulWidget {
  const GPGenitalHerpes({Key? key}) : super(key: key);

  @override
  _GPGenitalHerpesState createState() => _GPGenitalHerpesState();
}

class _GPGenitalHerpesState extends State<GPGenitalHerpes> {

  int? episode = 0;
  String antibioticTextOutput = "Select Options";

  List<String> antibioticTextInput =
  [
    """First line: 
Oral Aciclovir 400mg TDS

Duration: 5 days

Second line:
Oral Valaciclovir 500mg BD

Duration: 5 days

OR

Oral Famiciclovir 250mg TDS 

Duration: 5 days
""",
    """First line: 
Oral Aciclovir 800mg TDS

Duration: 2 days

Second line:
Oral Famiciclovir 1000mg BD

Duration: 1 day
""",
  ];


  notifyParent()
  {
    if (episode == 0)
      {
        antibioticTextOutput = antibioticTextInput[0];
      }
    else
      {
        antibioticTextOutput = antibioticTextInput[1];
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
      pageTitle: "Genital Herpes",
      antibioticTextOutput: antibioticTextOutput,

      topRedBox: TopRedInfoBox(
        boxColour: kPaedsDropDownBlue,
        textInput: 'First episode: oral antivirals are the primary treatment - treatment should commence within 5 days of the start or while new lesions are forming for people with a first clinical episode of genital herpes simplex virus (HSV) and refer to GUM.',
      ),

      toggleBox1: CustomTextDoubleSwitch(
          title: "1. Episode",
          indexPosition: episode,
          switchColour: kHighlightedToggleYellow,
          onValueChanged: (index)
          {
            setState(() {
              episode = index;
              notifyParent();
            });
          },
          minWidth: 80,
          firstText: 'First', 
          secondText: 'Recurrent'),


    );
  }
}
