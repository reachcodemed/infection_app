import 'package:flutter/material.dart';
import 'package:infection/custom_widgets.dart';
import 'package:infection/constants.dart';

class ICinfluenza extends StatefulWidget {
  @override
  _ICinfluenzaState createState() => _ICinfluenzaState();
}

class _ICinfluenzaState extends State<ICinfluenza> {
  String antibioticTextOutput = '';
  int? ugiBleed = 0;
  int? ngFeed = 0;
  int? laxatives = 0;
  int? prokinetics = 0;
  int? iaPathology = 0;
  int? ppi = 0;
  double minWidth = 60;
  bool tb3isActive = true;

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
    return InfectionControlWithTwoSubsections1EndPage(
      pageTitle: 'Influenza',
      antibioticTextOutput: antibioticTextOutput,
      subPanel1Text: 'Suspected',
      subPanel2Text: 'Confirmed',
      toggleBox1: CustomTextDoubleSwitch(
          title: 'Suspected Influenza case?',
          indexPosition: ugiBleed,
          onValueChanged: (index) {
            setState(() {
              ugiBleed = index;
            });
          },
          minWidth: minWidth,
          switchColour: kHighlightedToggleYellow,
          firstText: 'No',
          secondText: 'Yes'),
      toggleBox2: CustomTextDoubleSwitch(
          title: '',
          indexPosition: ngFeed,
          onValueChanged: (index) {
            setState(() {
              ngFeed = index;
            });
          },
          minWidth: MediaQuery.of(context).size.width * 0.39,
          switchColour: kHighlightedToggleYellow,
          firstText: 'Inpatient',
          secondText: 'A&E Patient'),
      toggleBox3: CustomTextDoubleSwitch(
          title: 'Confirmed Influenza Case?',
          indexPosition: laxatives,
          onValueChanged: (index) {
            setState(() {
              laxatives = index;
            });
          },
          minWidth: minWidth,
          switchColour: kHighlightedToggleYellow,
          firstText: 'No',
          secondText: 'Yes'),
      outputPanelTitle: 'Advice',
    );
  }
}
