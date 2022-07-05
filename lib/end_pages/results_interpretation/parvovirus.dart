import 'package:flutter/material.dart';
import 'package:infection/custom_widgets.dart';
import 'package:infection/constants.dart';

class RIparvovirus extends StatefulWidget {
  @override
  _RIparvovirusState createState() => _RIparvovirusState();
}

class _RIparvovirusState extends State<RIparvovirus> {
  String antibioticTextOutput = '';
  int? parvovirusIgM = 0;
  int? parvovirusIgG = 0;
  int? pregnant = 0;

  double minWidth = 60;

  notifyParent() {
    setState(() {
      parvoOutput();
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
    return ResultsInterpretationEndPage(
      pageTitle: 'Parvovirus',
      antibioticTextOutput: antibioticTextOutput,
      toggleBox1: CustomTextDoubleSwitch(
          title: 'Parvovirus IgM',
          indexPosition: parvovirusIgM,
          minWidth: (minWidth * 1.45),
          onValueChanged: (index) {
            setState(() {
              parvovirusIgM = index;
              parvoOutput();
            });
          },
          switchColour: kHighlightedToggleYellow,
          firstText: 'Negative',
          secondText: 'Positive'),
      toggleBox2: CustomTextDoubleSwitch(
          title: 'Parvovirus IgG',
          minWidth: (minWidth * 1.45),
          indexPosition: parvovirusIgG,
          onValueChanged: (index) {
            setState(() {
              parvovirusIgG = index;
              parvoOutput();
            });
          },
          switchColour: kHighlightedToggleYellow,
          firstText: 'Negative',
          secondText: 'Positive'),
      toggleBox3: CustomTextDoubleSwitch(
          title: 'Pregnant',
          indexPosition: pregnant,
          onValueChanged: (index) {
            setState(() {
              pregnant = index;
              parvoOutput();
            });
          },
          switchColour: kHighlightedToggleYellow,
          minWidth: (minWidth * 1.45),
          firstText: 'No',
          secondText: 'Yes'),
    );
  }

  void parvoOutput() {
    if (parvovirusIgM == 0) // IGM NEGATIVE
    {
      if (parvovirusIgG == 0) // IGG NEGATIVE
      {
        if (pregnant == 0) // NOT PREGNANT
        {
          antibioticTextOutput =
              "No serological evidence of previous or current Parvovirus infection";
        } else // PREGNANT
        {
          antibioticTextOutput =
              "There is no serological evidence of previous or current Parvovirus infection. Please reassure patient that there is not risk to pregnancy";
        }
      } else // IGG POSITIVE
      {
        if (pregnant == 0) // NOT PREGNANT
        {
          antibioticTextOutput =
              "Consistent with Parvovirus infection at some time in the past";
        } else // PREGNANT
        {
          antibioticTextOutput =
              "Consistent with Parvovirus infection at some time in the past\n\nIf the patient has already booked, ensure that the booking blood is also tested for Parvovirus IgM and IgG";
        }
      }
    } else // IGM POSITIVE
    {
      if (parvovirusIgG == 0) // IGG NEGATIVE
      {
        if (pregnant == 0) // NOT PREGNANT
        {
          antibioticTextOutput =
              "Could be consistent with acute infection\n\nRepeat serology in two weeks time to see if the patient seroconverts";
        } else // PREGNANT
        {
          antibioticTextOutput =
              "Could be consistent with acute infection\n\nSend EDTA blood for Parvovirus B19 DNA and refer the patient to Foetal Medicine for follow-up\n\nRepeat Parvovirus serology in two-three weeks time to see if the patient seroconverts and also ensure that the booking blood is also tested for Parvovirus IgM and IgG";
        }
      } else // IGG POSITIVE
      {
        if (pregnant == 0) // NOT PREGNANT
        {
          antibioticTextOutput =
              "Could be consistent with acute infection\n\nRepeat serology in two weeks time to see if the patient seroconverts";
        } else // PREGNANT
        {
          antibioticTextOutput =
              "Could be consistent with acute infection\n\nSend EDTA blood for Parvovirus B19 DNA and refer the patient to Foetal Medicine for follow-up\n\nRepeat Parvovirus serology in two-three weeks time to see if the patient seroconverts and also ensure that the booking blood is also tested for Parvovirus IgM and IgG";
        }
      }
    }
  }
}
