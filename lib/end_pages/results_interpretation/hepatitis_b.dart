import 'package:flutter/material.dart';
import 'package:infection/custom_widgets.dart';
import 'package:infection/constants.dart';

class RIhepB extends StatefulWidget {
  @override
  _RIhepBState createState() => _RIhepBState();
}

class _RIhepBState extends State<RIhepB> {
  String antibioticTextOutput = '';
  int? hbsAg = 0;
  int? hbcAb = 0;
  int? hbsAb = 0;
  int? hbcIgM = 0;

  double minWidth = 60;

  notifyParent() {
    setState(() {
      hepbOutput();
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
      pageTitle: 'Hepatitis B',
      antibioticTextOutput: antibioticTextOutput,
      toggleBox1: CustomTextDoubleSwitch(
        title: 'Surface Antigen (HBsAg)',
        indexPosition: hbsAg,
        onValueChanged: (index) {
          setState(() {
            hbsAg = index;
            hepbOutput();
          });
        },
        minWidth: minWidth,
        switchColour: kHighlightedToggleYellow,
        firstText: 'Negative',
        secondText: 'Positive',
      ),
      toggleBox2: CustomTextDoubleSwitch(
        title: 'Core Antibody (anti-HBc)',
        indexPosition: hbcAb,
        onValueChanged: (index) {
          setState(() {
            hbcAb = index;
            hepbOutput();
          });
        },
        minWidth: minWidth,
        switchColour: kHighlightedToggleYellow,
        firstText: 'Negative',
        secondText: 'Positive',
      ),
      toggleBox3: CustomTextDoubleSwitch(
        title: 'Surface Antibody (anti-HBs)',
        indexPosition: hbsAb,
        onValueChanged: (index) {
          setState(() {
            hbsAb = index;
            hepbOutput();
          });
        },
        minWidth: minWidth,
        switchColour: kHighlightedToggleYellow,
        firstText: 'Negative',
        secondText: 'Positive',
      ),
      toggleBox4: CustomTextDoubleSwitch(
        title: 'Core IgM (IgM anti-HBc)',
        indexPosition: hbcIgM,
        onValueChanged: (index) {
          setState(() {
            hbcIgM = index;
            hepbOutput();
          });
        },
        minWidth: minWidth,
        switchColour: kHighlightedToggleYellow,
        firstText: 'Negative',
        secondText: 'Positive',
      ),
    );
  }

  void hepbOutput() {
    if (hbsAg == 0) // SURFACE ANTIGEN NEGATIVE
    {
      if (hbcAb == 0) // CORE ANTIBODY NEGATIVE
      {
        if (hbsAb == 0) // SURFACE ANTIBODY NOT DETECTED
        {
          if (hbcIgM == 0) // CORE IGM NOT DETECTED
          {
            antibioticTextOutput =
                "There is no serological evidence of past or current Hepatitis B infection.\n\nIf the patient is at risk of Hepatitis B infection, consider vaccination if appropriate";
          } else // CORE IGM DETECTED
          {
            antibioticTextOutput =
                "The positive Core IgM result is likely to be a false positive given that the patient is surface antigen and core antibody negative. Please repeat the test";
          }
        } else // SURFACE ANTIBODY DETECTED
        {
          if (hbcIgM == 0) // CORE IGM NOT DETECTED
          {
            antibioticTextOutput =
                "There is no serological evidence of past or current Hepatitis B infection. The presence of surface antibody is most likely as a result of Hepatitis B vaccination";
          } else // CORE IGM DETECTED
          {
            antibioticTextOutput =
                "The positive Core IgM result is likely to be a false positive given that the patient is surface antigen and core antibody negative. The positive surface antibody result may be a result of vaccination";
          }
        }
      } else // CORE ANTIBODY POSITIVE
      {
        if (hbsAb == 0) // SURFACE ANTIBODY NOT DETECTED
        {
          if (hbcIgM == 0) // CORE IGM NOT DETECTED
          {
            antibioticTextOutput =
                "This result is consistent with Hepatitis B infection in the past. The patient is not a carrier and does not require immunisation. Negative surface antibody in the context of past infection is unusual";
          } else // CORE IGM DETECTED
          {
            antibioticTextOutput =
                "The positive Core IgM result is likely to be a false positive given that the patient is surface antigen negative. Please repeat the test";
          }
        } else // SURFACE ANTIBODY DETECTED
        {
          if (hbcIgM == 0) // CORE IGM NOT DETECTED
          {
            antibioticTextOutput =
                "This result is consistent with Hepatitis B infection in the past. The patient is not a carrier and does not require immunisation. The positive surface antibody result is most likely due to infection, but the patient may also have been vaccinated in the past";
          } else // CORE IGM DETECTED
          {
            antibioticTextOutput =
                "The positive Core IgM result is likely to be a false positive given that the patient is surface antigen and core antibody negative. The rest of the result suggest previous Hepatitis B infection / vaccination. Please repeat the test";
          }
        }
      }
    } else // SURFACE ANTIGEN POSITIVE
    {
      if (hbcAb == 0) // CORE ANTIBODY NEGATIVE
      {
        if (hbsAb == 0) // SURFACE ANTIBODY NOT DETECTED
        {
          if (hbcIgM == 0) // CORE IGM NOT DETECTED
          {
            antibioticTextOutput =
                "This result could be consistent with acute Hepatitis B infection. Repeat the test in two weeks to assess if seroconversion has taken place and send 2 x EDTA bloods for Hepatitis B viral load";
          } else // CORE IGM DETECTED
          {
            antibioticTextOutput =
                "This result could be consistent with acute Hepatitis B infection, suggesting recent acquisition. Please send a repeat test with 2 x EDTA bloods for Hepatitis B viral load";
          }
        } else // SURFACE ANTIBODY DETECTED
        {
          if (hbcIgM == 0) // CORE IGM NOT DETECTED
          {
            antibioticTextOutput =
                "This is an unusual result. The surface antigen result is suggestive of Hepatitis B infection.\n\nThere is also a positive surface antibody result, which is unlikely without the Hepatitis Core antibody result also being positive.\n\nAnother possible scenario is that this is a patient who has received Hepatitis B vaccination and despite the vaccination has gone on to become infected with Hepatitis B.\n\nRepeat the test in two weeks to assess if seroconversion has taken place and send 2 x EDTA bloods for Hepatitis B viral load";
          } else // CORE IGM DETECTED
          {
            antibioticTextOutput =
                "This result could be consistent with acute Hepatitis B infection, suggesting recent acquisition, albeit the lack of core antibody in the presence of surface antibody is unusual, however, the surface antibody could be as a result of vaccination.\n\nPlease send a repeat test with 2 x EDTA bloods for Hepatitis B viral load";
          }
        }
      } else // CORE ANTIBODY POSITIVE
      {
        if (hbsAb == 0) // SURFACE ANTIBODY NOT DETECTED
        {
          if (hbcIgM == 0) // CORE IGM NOT DETECTED
          {
            antibioticTextOutput =
                "This result is consistent with Hepatitis B infection. If this is the first result for the patient, send a repeat serum to confirm this result.\n\nIn addition, send 2 x EDTA bloods for Hepatitis B viral load. Correlated with clinical symptoms and liver function";
          } else // CORE IGM DETECTED
          {
            antibioticTextOutput =
                "This result could be consistent with acute Hepatitis B infection, suggesting recent acquisition.\n\nPlease send a repeat test with 2 x EDTA bloods for Hepatitis B viral load";
          }
        } else // SURFACE ANTIBODY DETECTED
        {
          if (hbcIgM == 0) // CORE IGM NOT DETECTED
          {
            antibioticTextOutput =
                "This result is consistent with Hepatitis B infection. If this is the first result for the patient, send a repeat serum to confirm this result.\n\nIn addition, send 2 x EDTA bloods for Hepatitis B viral load";
          } else // CORE IGM DETECTED
          {
            antibioticTextOutput =
                "This result could be consistent with acute Hepatitis B infection, suggesting recent acquisition. Please send a repeat test with 2 x EDTA bloods for Hepatitis B viral load";
          }
        }
      }
    }
  }
}
