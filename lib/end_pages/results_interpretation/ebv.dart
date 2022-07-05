import 'package:flutter/material.dart';
import 'package:infection/custom_widgets.dart';
import 'package:infection/constants.dart';

class RIebv extends StatefulWidget {
  @override
  _RIebvState createState() => _RIebvState();
}

class _RIebvState extends State<RIebv> {
  String antibioticTextOutput = '';
  int? ebvIgM = 0;
  int? ebvVCA = 0;
  int? cmvIgM = 0;
  int? ebvEBNA = 0;

  double minWidth = 60;

  notifyParent() {
    setState(() {});
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
      pageTitle: 'Epstein Barr Virus',
      antibioticTextOutput: antibioticTextOutput,
      toggleBox1: CustomTextDoubleSwitch(
          title: 'EBV IgM',
          indexPosition: ebvIgM,
          minWidth: (minWidth * 1.67),
          onValueChanged: (index) {
            setState(() {
              ebvIgM = index;
              ebvOutput();
            });
          },
          switchColour: kHighlightedToggleYellow,
          firstText: 'Negative',
          secondText: 'Positive'),
      toggleBox2: CustomTextDoubleSwitch(
          title: 'EBV VCA',
          indexPosition: ebvVCA,
          minWidth: (minWidth * 1.67),
          onValueChanged: (index) {
            setState(() {
              ebvVCA = index;
              ebvOutput();
            });
          },
          switchColour: kHighlightedToggleYellow,
          firstText: 'Negative',
          secondText: 'Positive'),
      toggleBox3: CustomTextDoubleSwitch(
          title: 'EBV EBNA',
          minWidth: (minWidth * 1.67),
          indexPosition: ebvEBNA,
          onValueChanged: (index) {
            setState(() {
              ebvEBNA = index;
              ebvOutput();
            });
          },
          switchColour: kHighlightedToggleYellow,
          firstText: 'Negative',
          secondText: 'Positive'),
      toggleBox4: CustomTextDoubleSwitch(
          title: 'CMV IgM',
          indexPosition: cmvIgM,
          onValueChanged: (index) {
            setState(() {
              cmvIgM = index;
              ebvOutput();
            });
          },
          switchColour: kHighlightedToggleYellow,
          minWidth: (minWidth * 1.67),
          firstText: 'Negative',
          secondText: 'Positive'),
    );
  }

  void ebvOutput() {
    setState(() {
      if (ebvIgM == 0) // IGM NEGATIVE
      {
        if (ebvVCA == 0) // ebvVCA NEGATIVE
        {
          if (ebvEBNA == 0) // ebvEBNA NEGATIVE
          {
            if (cmvIgM == 0) // CMVIgM NEGATIVE
            {
              antibioticTextOutput =
                  "No serological evidence of past or current EBV infection";
            } else if (cmvIgM == 1) // CMVIgM POS
            {
              antibioticTextOutput =
                  "No serological evidence of EBV infection.\n\n CMV IgM is positive, please refer to CMV interpretation section";
            }
          } else if (ebvEBNA == 1) // ebvEBNA POSITIVE
          {
            if (cmvIgM == 0) // CMVIgM NEGATIVE
            {
              antibioticTextOutput =
                  "Unusual EBV serology results, probably non-specific.\n\nIf clinically suspicious of EBV related symptoms, please send an EDTA blood tube for EBV viral load";
            } else if (cmvIgM == 1) // CMVIgM POS
            {
              antibioticTextOutput =
                  "Unusual EBV serology results, probably non-specific.\n\nIf clinically suspicious of EBV related symptoms, please send an EDTA blood tube for EBV viral load.\n\nCMV IgM is also positive, please refer to CMV interpretation section";
            }
          }
        } else if (ebvVCA == 1) // ebvVCA POSITIVE
        {
          if (ebvEBNA == 0) // ebvEBNA NEGATIVE
          {
            if (cmvIgM == 0) // CMVIgM NEGATIVE
            {
              antibioticTextOutput =
                  "This result suggests EBV infection occurred at some time.\n\nIn patients where bone marrow failure, severe glandular fever or EBV lymphoproliferative disease is suspected, please send 2 x EDTA samples for EBV viral load";
            } else if (cmvIgM == 1) // CMVIgM POS
            {
              antibioticTextOutput =
                  "This result suggests EBV infection occurred at some time.\n\nCMV IgM is also positive, please refer to CMV interpretation section";
            }
          } else if (ebvEBNA == 1) // ebvEBNA POSITIVE
          {
            if (cmvIgM == 0) // CMVIgM NEGATIVE
            {
              antibioticTextOutput = "This result suggests past EBV infection";
            } else if (cmvIgM == 1) // CMVIgM POS
            {
              antibioticTextOutput =
                  "This result suggests EBV infection occurred at some time.\n\nCMV IgM is also positive, please refer to CMV interpretation section";
            }
          }
        }
      } else // IGM POSITIVE
      {
        if (ebvVCA == 0) // ebvVCA NEGATIVE
        {
          if (ebvEBNA == 0) // ebvEBNA NEGATIVE
          {
            if (cmvIgM == 0) // CMVIgM NEGATIVE
            {
              antibioticTextOutput =
                  "Unusual EBV serology results in the absence of very early glandular fever i.e., outside this qualification probably non-specific.\n\n If clinically suspicious of EBV related symptoms, please send a repeat clotted blood for follow up serology and an EDTA blood tube for EBV viral load";
            } else if (cmvIgM == 1) // CMVIgM POS
            {
              antibioticTextOutput =
                  "The EBV results are compatible with either\n\n• Acute EBV infection with polyclonal stimulation of CMV antibodies\n•  Acute EBV and CMV co-infection\n• Acute EBV or CMV with herpes group specific cross reactions";
            }
          } else if (ebvEBNA == 1) // ebvEBNA POSITIVE
          {
            if (cmvIgM == 0) // CMVIgM NEGATIVE
            {
              antibioticTextOutput =
                  "Unusual EBV serology results in the absence of very early glandular fever i.e., outside this qualification probably non-specific.\n\nIf clinically suspicious of EBV related symptoms, please send a repeat clotted blood for follow up serology and an EDTA blood tube for EBV viral load";
            } else if (cmvIgM == 1) // CMVIgM POS
            {
              antibioticTextOutput =
                  "The EBV results are compatible with either\n\n• Acute EBV infection with polyclonal stimulation of CMV antibodies\n•  Acute EBV and CMV co-infection\n• Acute EBV or CMV with herpes group specific cross reactions";
            }
          }
        } else if (ebvVCA == 1) // ebvVCA POSITIVE
        {
          if (ebvEBNA == 0) // ebvEBNA NEGATIVE
          {
            if (cmvIgM == 0) // CMVIgM NEGATIVE
            {
              antibioticTextOutput =
                  "Evidence of acute primary EBV infection\n\nIn patients where bone marrow failure, severe glandular fever or EBV lymphoproliferative disease is suspected, please send 2 x EDTA samples for EBV viral load\n\nPlease advise patients to refrain from engaging in contact sports";
            } else if (cmvIgM == 1) // CMVIgM POS
            {
              antibioticTextOutput =
                  "The EBV results are compatible with either\n\n• Acute EBV infection with polyclonal stimulation of CMV antibodies\n• Acute EBV and CMV co-infection\n• EBV and CMV reactivation\n• Acute EBV or CMV with herpes group specific cross reactions";
            }
          } else if (ebvEBNA == 1) // ebvEBNA POSITIVE
          {
            if (cmvIgM == 0) // CMVIgM NEGATIVE
            {
              antibioticTextOutput =
                  "The EBV result may indicate any of the following\n\n• Recent acute but convalescing EBV infection\n• False positive EBV IgM\n• EBV reactivation";
            } else if (cmvIgM == 1) // CMVIgM POS
            {
              antibioticTextOutput =
                  "The EBV results are compatible with either\n\n• Acute EBV infection with polyclonal stimulation of CMV antibodies\n• Acute EBV and CMV co-infection\n• EBV and CMV reactivation\n• Acute EBV or CMV with herpes group specific cross reactions";
            }
          }
        }
      }
    });
  }
}
