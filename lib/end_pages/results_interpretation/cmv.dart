import 'package:flutter/material.dart';
import 'package:infection/custom_widgets.dart';
import 'package:infection/constants.dart';

class RIcmv extends StatefulWidget {
  @override
  _RIcmvState createState() => _RIcmvState();
}

class _RIcmvState extends State<RIcmv> {
  String antibioticTextOutput = '';
  int? cmvIgM = 0;
  int? cmvIgG = 0;
  //int? cmvAvidity = 0;
  int? ebvIgM = 0;
  double minWidth = 60;
  bool componentOn = true;

  notifyParent() {
    setState(() {
      cmvOutput();
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
      pageTitle: 'Cytomegalovirus (CMV)',
      antibioticTextOutput: antibioticTextOutput,
      toggleBox1: CustomTextDoubleSwitch(
          title: 'CMV IgM',
          indexPosition: cmvIgM,
          minWidth: (minWidth * 1.65),
          onValueChanged: (index) {
            setState(() {
              cmvIgM = index;
              cmvOutput();
            });
          },
          switchColour: kHighlightedToggleYellow,
          firstText: 'Negative',
          secondText: 'Positive'),
      toggleBox2: CustomTextDoubleSwitch(
          title: 'CMV IgG',
          indexPosition: cmvIgG,
          minWidth: (minWidth * 1.65),
          onValueChanged: (index) {
            setState(() {
              cmvIgG = index;
              if (index == 0) {
                componentOn = false;
              }
              cmvOutput();
            });
          },
          switchColour: kHighlightedToggleYellow,
          firstText: 'Negative',
          secondText: 'Positive'),
      toggleBox4: CustomTextDoubleSwitch(
          title: 'EBV IgM',
          isActive: true,
          indexPosition: ebvIgM,
          minWidth: (minWidth * 1.65),
          onValueChanged: (index) {
            setState(() {
              ebvIgM = index;
              cmvOutput();
            });
          },
          switchColour: kHighlightedToggleYellow,
          firstText: 'Negative',
          secondText: 'Positive'),
    );
  }

  void cmvOutput() {
    setState(() {
      if (cmvIgM == 0) // CMV IGM NEGATIVE
      {
        if (cmvIgG == 0) // IGG NEGATIVE
        {
          if (ebvIgM == 0) // EBV IGM NEGATIVE
          {
            antibioticTextOutput =
                "No serological evidence of current or past CMV infection";
          } else // EBV IGM POSITIVE
          {
            antibioticTextOutput =
                "No serological evidence of current or past CMV infection. EBV IgM is positive, please refer to EBV serology interpretation";
          }
        } else // CMV IGG POSITIVE
        {
          if (ebvIgM == 0) // EBV IGM NEGATIVE
          {
            antibioticTextOutput =
                "This result indicates CMV infection at some time in the past";
          } else // EBV IGM POSITIVE
          {
            antibioticTextOutput =
                "This result suggests CMV infection at some time in the past. The positive EBV IgM suggests recent EBV infection, but should be correlated with other antibody markers for full interpretation, please refer to EBV serology interpretation";
          }
        }
      } else // CMV IGM POSITIVE
      {
        if (cmvIgG == 0) // IGG NEGATIVE
        {
          if (ebvIgM == 0) // EBV IGM NEGATIVE
          {
            antibioticTextOutput =
                "Given the positive CMV IgM but the absence of CMV IgG, there is a possibility that this is acute CMV infection.\n\nPlease send an EDTA blood for CMV viral load to confirm the result";
          } else // EBV IGM POSITIVE
          {
            antibioticTextOutput =
                "This result may be due to a CMV/EBV cross reaction or polyclonal stimulation during acute EBV infection.\n\nPlease send an EDTA blood for CMV and EBV viral load to evaluate further";
          }
        } else // CMV IGG POSITIVE
        {
          if (ebvIgM == 0) // EBV IGM NEGATIVE
          {
            antibioticTextOutput =
                "These results may indicate recent CMV infection.\n\nEither send a convalescent serum in 4 weeks to check for full serocoversion or send an EDTA blood for CMV viral load.";
          } else // EBV IGM POSITIVE
          {
            antibioticTextOutput =
                "This result may be due to a CMV/EBV cross reaction or polyclonal stimulation during acute EBV infection.\n\nPlease send an EDTA blood for CMV and EBV viral load to evaluate further";
          }
        }
      }
    });
  }
}
