import 'package:flutter/material.dart';
import 'package:infection/custom_widgets.dart';
import 'package:infection/constants.dart';

class RIrubella extends StatefulWidget {
  @override
  _RIrubellaState createState() => _RIrubellaState();
}

class _RIrubellaState extends State<RIrubella> {
  String antibioticTextOutput = '';
  int? rubellaIgM = 0;
  int? rubellaIgG = 0;
  int? healthStatus = 0;

  double minWidth = 60;

  notifyParent() {
    setState(() {
      rubellaOutput();
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
      pageTitle: 'Rubella',
      antibioticTextOutput: antibioticTextOutput,
      toggleBox1: CustomTextDoubleSwitch(
          title: 'Rubella IgM',
          indexPosition: rubellaIgM,
          minWidth: (minWidth * 1.45),
          onValueChanged: (index) {
            setState(() {
              rubellaIgM = index;
              rubellaOutput();
            });
          },
          switchColour: kHighlightedToggleYellow,
          firstText: 'Negative',
          secondText: 'Positive'),
      toggleBox2: CustomTextDoubleSwitch(
          title: 'Rubella IgG',
          indexPosition: rubellaIgG,
          minWidth: (minWidth * 1.45),
          onValueChanged: (index) {
            setState(() {
              rubellaIgG = index;
              rubellaOutput();
            });
          },
          switchColour: kHighlightedToggleYellow,
          firstText: 'Negative',
          secondText: 'Positive'),
      toggleBox3: QuadSwtichFullWidth(
          indexPosition: healthStatus,
          onValueChanged: (index) {
            setState(() {
              healthStatus = index;
              rubellaOutput();
            });
          },
          firstText: 'None',
          secondText: 'HIV',
          thirdText: 'Immune compromise',
          fourthText: 'Pregnant'),
    );
  }

  void rubellaOutput() {
    if (rubellaIgM == 0) // IGM NEGATIVE
    {
      if (rubellaIgG == 0) // IGG NEGATIVE
      {
        //state.isEnabled = true

        if (healthStatus == 0) // NONE
        {
          antibioticTextOutput =
              "We have found this patient to be susceptible to rubella. A normal course of MMR vaccine is 2 doses separated by a period of 1 month.\n\nIf the vaccine schedule has not been completed appropriately we suggest a further course of vaccine with follow up (taking appropriate precautions against pregnancy or immunocompromised status).\n\nPlease note that the potential transmissibility of MMR vaccine virus to others in contact with the vaccinee is extremely low. No precautions are required for contacts of vaccinated individuals\n\nIf patient has a good MMR vaccination history (minimum 3 doses of MMR vaccine):\n\nWe have not been able to demonstrate adequate post vaccination levels of rubella antibodies in this patient despite several doses of MMR vaccine.\n\nRegard as a non/low responder who is likely to be protected against symptomatic rubella if challenged, and is unlikely to respond to further courses of MMR vaccine";
        } else if (healthStatus == 1) // HIV
        {
          antibioticTextOutput =
              "We have found this patient to be susceptible to rubella. As this is a live vaccine MMR should not be given to immunocompromised patients without careful consideration of their immune status and the potential for disseminated infection\n\nIf the CD4 count is above 200 cells/mm3 it is generally considered safe to administer MMR vaccine.\n\nHIV positive adults with CD4 counts < 200 cells/mm3, a history of AIDS-defining illness, or clinical symptoms of HIV should not get the MMR vaccine";
        } else if (healthStatus == 2) // IMMUNOCOMPROMISED
        {
          antibioticTextOutput =
              "We have found this patient to be susceptible to rubella. As this is a live vaccine MMR should not be given to immunocompromised patients without careful consideration of their immune status and the potential for disseminated infection";
        } else // PREGNANT
        {
          antibioticTextOutput =
              "UK requirement is for pregnant women to have received 2 doses of MMR vaccine prior to pregnancy.\n\nWe have found this patient to be susceptible to rubella. We suggest a further course of MMR vaccine post-partum unless the patient has already received 2 documented doses of MMR vaccine within a period of one month.\n\nUndertake vaccination taking appropriate precautions, avoiding pregnancy within 1 month of the last dose.\n\nPlease note that the potential transmissibility of MMR vaccine virus to others in contact with the vaccinee is extremely low. No precautions are required for contacts of vaccinated individuals";
        }
      } else // IGG POSITIVE
      {
        //state.isEnabled = false
        antibioticTextOutput =
            "This result is consistent with rubella immunisation or infection at some time in the past";
      }
    } else // IGM POSITIVE
    {
      if (rubellaIgG == 0) // IGG NEGATIVE
      {
        //state.isEnabled = false
        antibioticTextOutput =
            "This result is likely to indicate acute rubella infection. Correlate the result with clinical findings and send a urine for rubella PCR. Repeat serology in 4 weeks time.\n\nEnsure the patient is isolated and notify result to local Health Protection Team";
      } else // IGG POSITIVE
      {
        //state.isEnabled = false
        antibioticTextOutput =
            "This result is likely to indicate acute rubella infection. Correlate the result with clinical findings and send a urine for rubella PCR\n\nEnsure the patient is isolated and notify result to local Health Protection Team";
      }
    }
  }
}
