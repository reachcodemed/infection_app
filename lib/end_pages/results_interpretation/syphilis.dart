import 'package:flutter/material.dart';
import 'package:infection/custom_widgets.dart';
import 'package:infection/constants.dart';

class RIsyphilis extends StatefulWidget {
  @override
  _RIsyphilisState createState() => _RIsyphilisState();
}

class _RIsyphilisState extends State<RIsyphilis> {
  String antibioticTextOutput = '';
  int? screenAb = 0;
  int? secondAb = 0;
  int? tppa = 0;
  int? igM = 0;
  int? rpr = 0;
  double minWidth = 60;

  notifyParent() {
    setState(() {
      syphilisOutput();
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
      pageTitle: 'Syphilis',
      antibioticTextOutput: antibioticTextOutput,
      toggleBox1: CustomTextDoubleSwitch(
          title: 'Screen Antibody',
          indexPosition: screenAb,
          onValueChanged: (index) {
            setState(() {
              screenAb = index;
              syphilisOutput();
            });
          },
          minWidth: MediaQuery.of(context).size.width * 0.2,
          switchColour: kHighlightedToggleYellow,
          firstText: 'Negative',
          secondText: 'Positive'),
      toggleBox2: CustomTextDoubleSwitch(
          title: 'Second Antibody',
          indexPosition: secondAb,
          onValueChanged: (index) {
            setState(() {
              secondAb = index;
              syphilisOutput();
            });
          },
          switchColour: kHighlightedToggleYellow,
          minWidth: MediaQuery.of(context).size.width * 0.2,
          firstText: 'Negative',
          secondText: 'Positive'),
      toggleBox3: CustomTextDoubleSwitch(
          title: 'TPPA',
          indexPosition: tppa,
          onValueChanged: (index) {
            setState(() {
              tppa = index;
              syphilisOutput();
            });
          },
          minWidth: MediaQuery.of(context).size.width * 0.2,
          switchColour: kHighlightedToggleYellow,
          firstText: 'Negative',
          secondText: 'Positive'),
      toggleBox4: CustomTextDoubleSwitch(
          title: 'IgM',
          indexPosition: igM,
          onValueChanged: (index) {
            setState(() {
              igM = index;
              syphilisOutput();
            });
          },
          switchColour: kHighlightedToggleYellow,
          minWidth: MediaQuery.of(context).size.width * 0.2,
          firstText: 'Negative',
          secondText: 'Positive'),
      toggleBox5: ToggleSwitchTriple(
        title: 'RPR',
        minWidth: MediaQuery.of(context).size.width * 0.16,
        indexPosition: rpr,
        switchColour: kHighlightedToggleYellow,
        onValueChanged: (index) {
          setState(() {
            rpr = index;
            syphilisOutput();
          });
        },
        firstText: 'Negative',
        secondText: '< 16',
        thirdText: '> 16',
      ),
    );
  }

  void syphilisOutput() {
    if (screenAb == secondAb) // SAME ANTIBODY RESULT
    {
      if (screenAb == 0) // ANTIBODY NEGATIVE
      {
        if (tppa == 0) // TPPA NEGATIVE
        {
          if (igM == 0) // IgM NEGATIVE
          {
            if (rpr == 0) // RPR NEGATIVE
            {
              antibioticTextOutput =
                  "No serological evidence of past or current Syphilis infection";
            } else if (rpr == 1) // RPR <16
            {
              antibioticTextOutput =
                  "RPR reactivity is likely to be biological false positive. Treponemal infection unlikely but please repeat to confirm";
            } else // RPR >16
            {
              antibioticTextOutput =
                  "RPR reactivity is likely to be biological false positive. Treponemal infection unlikely but please repeat to confirm\n\nConsider other causes of raised RPR";
            }
          } else // IgM POSITIVE
          {
            if (rpr == 0) // RPR NEGATIVE
            {
              antibioticTextOutput =
                  "IgM activity likely to be a false positive and non-specific";
            } else if (rpr == 1) // RPR <16
            {
              antibioticTextOutput =
                  "IgM activity likely to be a false positive and non-specific and RPR reactivity is likely to be biological false positive. Treponemal infection unlikely but please repeat to confirm";
            } else // RPR >16
            {
              antibioticTextOutput =
                  "IgM activity likely to be a false positive and non-specific and RPR reactivity is likely to be biological false positive. Treponemal infection unlikely but please repeat to confirm";
            }
          }
        } else // TPPA POSITIVE
        {
          if (igM == 0) // IgM NEGATIVE
          {
            if (rpr == 0) // RPR NEGATIVE
            {
              antibioticTextOutput =
                  "In a low-risk patient TPPA reactivity is likely to be false unless early infection is suspected.\n\nPlease repeat to confirm if clinically indicated.\n\nNo serological evidence of treponemal infection.\n\nIn a high-risk patient given the negative IgM result this may be consistent with treponemal infection at some time.";
            } else if (rpr == 1) // RPR <16
            {
              antibioticTextOutput =
                  "Unusual result, but likely to be consistent with treponemal infection at some time. Correlate clinically";
            } else // RPR >16
            {
              antibioticTextOutput =
                  "Unusual result, but likely to be consistent with treponemal infection at some time. Correlate clinically";
            }
          } else // IgM POSITIVE
          {
            if (rpr == 0) // RPR NEGATIVE
            {
              antibioticTextOutput =
                  "This result could be indicative of early infection. Refer the patient to the GUM clinic";
            } else if (rpr == 1) // RPR <16
            {
              antibioticTextOutput =
                  "This result could be indicative of early infection. Refer the patient to the GUM clinic";
            } else // RPR >16
            {
              antibioticTextOutput =
                  "This result could be indicative of early infection. Refer the patient to the GUM clinic";
            }
          }
        }
      } else // ANTIBODY POSITIVE
      {
        if (tppa == 0) // TPPA NEGATIVE
        {
          if (igM == 0) // IgM NEGATIVE
          {
            if (rpr == 0) // RPR NEGATIVE
            {
              antibioticTextOutput =
                  "Cannot exclude a previous treponemal infection although this is unlikely.\n\nIn the absence of Treponemal IgM, TPPA and RPR antibody, acute primary infection is highly unlikely.\n\nSuggest repeat testing to confirm these results particularly if there has been a recent at risk exposure, known contact with a treponemal positive partner or history of positive test results elsewhere.\n\nTreatment for treponemal infection is not advised at this stage as we cannot rule out false positive screening tests in this case";
            } else if (rpr == 1) // RPR <16
            {
              antibioticTextOutput =
                  "Consistent with treponemal infection at some time";
            } else // RPR >16
            {
              antibioticTextOutput =
                  "Consistent with treponemal infection at some time";
            }
          } else // IgM POSITIVE
          {
            if (rpr == 0) // RPR NEGATIVE
            {
              antibioticTextOutput =
                  "This result could be consistent with Primary Syphilis. Repeat the test and refer the patient to the GUM clinic";
            } else if (rpr == 1) // RPR <16
            {
              antibioticTextOutput =
                  "This result could be consistent with Primary Syphilis. Repeat the test and refer the patient to the GUM clinic";
            } else // RPR >16
            {
              antibioticTextOutput =
                  "This result could be consistent with Primary Syphilis. Repeat the test and refer the patient to the GUM clinic";
            }
          }
        } else // TPPA POSITIVE
        {
          if (igM == 0) // IgM NEGATIVE
          {
            if (rpr == 0) // RPR NEGATIVE
            {
              antibioticTextOutput =
                  "Reactive TPPA but negative RPR is consistent with treponemal infection at some time";
            } else if (rpr == 1) // RPR <16
            {
              antibioticTextOutput =
                  "Consistent with treponemal infection at some time.\n\nThis could be consistent with a recent infection if seroconversion, or a four-fold rise in RPR titre on parallel testing, were seen in comparison to an earlier sample.\n\nRPR titre ≤16 does not exclude active infection especially if there are signs suggesting syphilis or where adequate treatment of previously diagnosed syphilis has not been documented.";
            } else // RPR >16
            {
              antibioticTextOutput =
                  "Results suggest recent/active treponemal infection despite the absence of treponemal IgM.\n\nIf recently treated a further follow up blood sample is advised in 1-2 months.\n\nIt treated more than 2 months ago consider inadequate treatment/compliance and further treatment.";
            }
          } else // IgM POSITIVE
          {
            if (rpr == 0) // RPR NEGATIVE
            {
              antibioticTextOutput =
                  "Results suggest recent/acute treponemal infection. The negative RPR may suggest that the treponemal IgM may be non-specific unless the patient has been recently treated. Please send a further sample for confirmation.";
            } else if (rpr == 1) // RPR <16
            {
              antibioticTextOutput =
                  "Results suggest recent/active treponemal infection.\n\nThe low RPR titre may reflect either very early infection, a declining RPR post treatment or a false positive.\n\nPlease send a second sample for confirmation";
            } else // RPR >16
            {
              antibioticTextOutput =
                  "Consistent with treponemal infection at some time";
            }
          }
        }
      }
    } else // DIFFERENT ANTIBODY RESULT
    {
      antibioticTextOutput =
          "Note disparity in the antibody result. Please repeat the test. If the repeat test gives the same result, discuss with Microbiology";
    }
  }
}
