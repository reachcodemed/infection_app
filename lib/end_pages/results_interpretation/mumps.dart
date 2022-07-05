import 'package:flutter/material.dart';
import 'package:infection/custom_widgets.dart';
import 'package:infection/constants.dart';

class RImumps extends StatefulWidget {
  @override
  _RImumpsState createState() => _RImumpsState();
}

class _RImumpsState extends State<RImumps> {
  String antibioticTextOutput = '';
  int? mumpsIgM = 0;
  int? mumpsIgG = 0;
  int? healthStatus = 0;

  double minWidth = 72.5;

  notifyParent() {
    setState(() {
      mumpsOutput();
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
      pageTitle: 'Mumps',
      antibioticTextOutput: antibioticTextOutput,
      toggleBox1: CustomTextDoubleSwitch(
          title: 'Mumps IgM',
          indexPosition: mumpsIgM,
          minWidth: (minWidth * 1.45),
          onValueChanged: (index) {
            setState(() {
              mumpsIgM = index;
              mumpsOutput();
            });
          },
          switchColour: kHighlightedToggleYellow,
          firstText: 'Negative',
          secondText: 'Positive'),
      toggleBox2: CustomTextDoubleSwitch(
          title: 'Mumps IgG',
          indexPosition: mumpsIgG,
          minWidth: (minWidth * 1.45),
          onValueChanged: (index) {
            setState(() {
              mumpsIgG = index;
              mumpsOutput();
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
              mumpsOutput();
            });
          },
          firstText: 'None',
          secondText: 'HIV',
          thirdText: 'Immune compromise',
          fourthText: 'Pregnant'),
    );
  }

  void mumpsOutput() {
    if (mumpsIgM == 0) // IGM NEGATIVE
    {
      if (mumpsIgG == 0) // IGG NEGATIVE
      {
        //state.isEnabled = true

        if (healthStatus == 0) // NONE
        {
          antibioticTextOutput =
              "We have found this patient to be susceptible to mumps. A normal course of MMR vaccine is 2 doses separated by a period of 1 month.\n\nIf the vaccine schedule has not been completed appropriately we suggest a further course of vaccine with follow up (taking appropriate precautions against pregnancy or immunocompromised status).\n\nPlease note that the potential transmissibility of MMR vaccine virus to others in contact with the vaccinee is extremely low. No precautions are required for contacts of vaccinated individuals\n\nIf patient has a good MMR vaccination history (minimum 3 doses of MMR vaccine):\n\nWe have not been able to demonstrate adequate post vaccination levels of mumps antibodies in this patient despite several doses of MMR vaccine.\n\nRegard as a non/low responder who is likely to be protected against symptomatic mumps if challenged, and is unlikely to respond to further courses of MMR vaccine";
        } else if (healthStatus == 1) // HIV
        {
          antibioticTextOutput =
              "We have found this patient to be susceptible to mumps. As this is a live vaccine MMR should not be given to immunocompromised patients without careful consideration of their immune status and the potential for disseminated infection\n\nIf the CD4 count is above 200 cells/mm3 it is generally considered safe to administer MMR vaccine.\n\nHIV positive adults with CD4 counts < 200 cells/mm3, a history of AIDS-defining illness, or clinical symptoms of HIV should not get the MMR vaccine";
        } else if (healthStatus == 2) // IMMUNOCOMPROMISED
        {
          antibioticTextOutput =
              "We have found this patient to be susceptible to mumps. As this is a live vaccine MMR should not be given to immunocompromised patients without careful consideration of their immune status and the potential for disseminated infection";
        } else // PREGNANT
        {
          antibioticTextOutput =
              "UK requirement is for pregnant women to have received 2 doses of MMR vaccine prior to pregnancy.\n\nWe have found this patient to be susceptible to mumps. We suggest a further course of MMR vaccine post partum unless the patient has already received 2 documented doses of MMR vaccine within a period of one month.\n\nUndertake vaccination taking appropriate precautions, avoiding pregnancy within 1 month of the last dose.\n\nPlease note that the potential transmissibility of MMR vaccine virus to others in contact with the vaccinee is extremely low. No precautions are required for contacts of vaccinated individuals";
        }
      } else // IGG POSITIVE
      {
        //state.isEnabled = false
        antibioticTextOutput =
            "This result is consistent with mumps immunisation or infection at some time in the past";
      }
    } else // IGM POSITIVE
    {
      if (mumpsIgG == 0) // IGG NEGATIVE
      {
        //state.isEnabled = false
        antibioticTextOutput =
            "This result is likely to indicate acute mumps infection. Correlate the result with clinical findings and send a urine for mumps PCR. Repeat serology in 4 weeks time.\n\nEnsure the patient is isolated and notify result to local Health Protection Team";
      } else // IGG POSITIVE
      {
        //state.isEnabled = false
        antibioticTextOutput =
            "This result is likely to indicate acute mumps infection. Correlate the result with clinical findings and send a urine for mumps PCR\n\nEnsure the patient is isolated and notify result to local Health Protection Team";
      }
    }
  }
}
