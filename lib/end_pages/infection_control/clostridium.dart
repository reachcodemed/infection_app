import 'package:flutter/material.dart';
import 'package:infection/custom_widgets.dart';
import 'package:infection/constants.dart';

class ICclostridium extends StatefulWidget {
  @override
  _ICclostridiumState createState() => _ICclostridiumState();
}

class _ICclostridiumState extends State<ICclostridium> {
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
    setState(() {
      antibioticTextOutput =
          'Each patient must be assessed by a doctor before a stool sample is sent for Clostridioides difficile testing. If there is no other reasonable cause for diarrhoea except Clostridioides difficile, please send a stool (type 6/7), place the patient in a sideroom if not already in one and commence therapy as per guidelines';
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
    return InfectionControlWithTopBoxEndPage(
      pageTitle: 'Clostridioides difficile',
      antibioticTextOutput: antibioticTextOutput,
      topPanelText:
          'Before sending stool for Clostridioides difficile, perform a full medical review and consider other causes of diarrhoea. Select any of the following which are relevant for your patient and consider the advice provided',
      toggleBox1: CustomTextDoubleSwitch(
          title: '1. Upper GI Bleed?',
          indexPosition: ugiBleed,
          minWidth: MediaQuery.of(context).size.width * 0.13,
          onValueChanged: (index) {
            setState(() {
              ugiBleed = index;
              if (ugiBleed == 1) {
                antibioticTextOutput =
                    'A patient with an Upper GI Bleed may well be having malaena. This is not infectious diarrhoea and should not be sent for Clostridioides difficile testing\n\nIf there is ongoing concern regarding Clostridioides difficile, please discuss with a Microbiology Consultant';
              } else {
                antibioticTextOutput =
                    'Each patient must be assessed by a doctor before a stool sample is sent for Clostridioides difficile testing. If there is no other reasonable cause for diarrhoea except Clostridioides difficile, please send a stool (type 6/7), place the patient in a sideroom if not already in one and commence therapy as per guidelines';
              }
              //ugiBleed = 0;
              ngFeed = 0;
              laxatives = 0;
              prokinetics = 0;
              iaPathology = 0;
              ppi = 0;
            });
          },
          switchColour: kHighlightedToggleYellow,
          firstText: 'No',
          secondText: 'Yes'),
      toggleBox2: CustomTextDoubleSwitch(
          title: '2. Nasogastric Feed?',
          indexPosition: ngFeed,
          onValueChanged: (index) {
            setState(() {
              ngFeed = index;
              if (ngFeed == 1) {
                antibioticTextOutput =
                    'Patients who are receiving nasogastric feed often have very loose stool because of the short transit time. Be cautious in sending a Clostridioides difficile sample in these patients\n\nIf there is ongoing concern regarding Clostridioides difficile, please discuss with a Microbiology Consultant';
              } else {
                antibioticTextOutput =
                    'Each patient must be assessed by a doctor before a stool sample is sent for Clostridioides difficile testing. If there is no other reasonable cause for diarrhoea except Clostridioides difficile, please send a stool (type 6/7), place the patient in a sideroom if not already in one and commence therapy as per guidelines';
              }
              ugiBleed = 0;
              //ngFeed = 0;
              laxatives = 0;
              prokinetics = 0;
              iaPathology = 0;
              ppi = 0;
            });
          },
          minWidth: MediaQuery.of(context).size.width * 0.13,
          switchColour: kHighlightedToggleYellow,
          firstText: 'No',
          secondText: 'Yes'),
      toggleBox3: CustomTextDoubleSwitch(
          title: '3. Laxatives?',
          indexPosition: laxatives,
          onValueChanged: (index) {
            setState(() {
              laxatives = index;
              if (laxatives == 1) {
                antibioticTextOutput =
                    'Patients on laxatives will by intention develop loose stools. If a patient is on laxatives, 48 hours should be left between stopping the laxatives and sending a stool sample\n\nIf there is ongoing concern regarding Clostridioides difficile, please discuss with a Microbiology Consultant';
              } else {
                antibioticTextOutput =
                    'Each patient must be assessed by a doctor before a stool sample is sent for Clostridioides difficile testing. If there is no other reasonable cause for diarrhoea except Clostridioides difficile, please send a stool (type 6/7), place the patient in a sideroom if not already in one and commence therapy as per guidelines';
              }
              ugiBleed = 0;
              ngFeed = 0;
              //laxatives = 0;
              prokinetics = 0;
              iaPathology = 0;
              ppi = 0;
            });
          },
          minWidth: MediaQuery.of(context).size.width * 0.13,
          switchColour: kHighlightedToggleYellow,
          firstText: 'No',
          secondText: 'Yes'),
      toggleBox4: CustomTextDoubleSwitch(
          title: '4. Prokinetics?',
          indexPosition: prokinetics,
          onValueChanged: (index) {
            setState(() {
              prokinetics = index;
              if (prokinetics == 1) {
                antibioticTextOutput =
                    'The usage of prokinetics in patients effectively enhances gastrointestinal motility and can lead to loose stools, e.g. Erythromycin. Samples for Clostridioides difficile should be sent with caution\n\nIf there is ongoing concern regarding Clostridioides difficile, please discuss with a Microbiology Consultant';
              } else {
                antibioticTextOutput =
                    'Each patient must be assessed by a doctor before a stool sample is sent for Clostridioides difficile testing. If there is no other reasonable cause for diarrhoea except Clostridioides difficile, please send a stool (type 6/7), place the patient in a sideroom if not already in one and commence therapy as per guidelines';
              }
              ugiBleed = 0;
              ngFeed = 0;
              laxatives = 0;
              //prokinetics = 0;
              iaPathology = 0;
              ppi = 0;
            });
          },
          minWidth: MediaQuery.of(context).size.width * 0.13,
          switchColour: kHighlightedToggleYellow,
          firstText: 'No',
          secondText: 'Yes'),
      toggleBox5: CustomTextDoubleSwitch(
          title: '5. Intra-abdominal Pathology?',
          indexPosition: iaPathology,
          onValueChanged: (index) {
            setState(() {
              iaPathology = index;
              if (iaPathology == 1) {
                antibioticTextOutput =
                    'A number of intra-abdominal pathologies, including collections, diverticulitis, inflammatory bowel disease, irritable bowel syndrome, malignancy, etc... can present with diarrhoea. Samples for Clostridioides difficile should be sent with caution\n\nIf there is ongoing concern regarding Clostridioides difficile, please discuss with a Microbiology Consultant';
              } else {
                antibioticTextOutput =
                    'Each patient must be assessed by a doctor before a stool sample is sent for Clostridioides difficile testing. If there is no other reasonable cause for diarrhoea except Clostridioides difficile, please send a stool (type 6/7), place the patient in a sideroom if not already in one and commence therapy as per guidelines';
              }
              ugiBleed = 0;
              ngFeed = 0;
              laxatives = 0;
              prokinetics = 0;
              //iaPathology = 0;
              ppi = 0;
            });
          },
          minWidth: MediaQuery.of(context).size.width * 0.13,
          switchColour: kHighlightedToggleYellow,
          firstText: 'No',
          secondText: 'Yes'),
      toggleBox6: CustomTextDoubleSwitch(
          title: '6. Proton Pump Inhibitor?',
          indexPosition: ppi,
          onValueChanged: (index) {
            setState(() {
              ppi = index;
              if (ppi == 1) {
                antibioticTextOutput =
                    'Proton-pump Inhibitor. It is important to be cautious that this may not represent Clostridioides difficile';
              } else {
                antibioticTextOutput =
                    'Each patient must be assessed by a doctor before a stool sample is sent for Clostridioides difficile testing. If there is no other reasonable cause for diarrhoea except Clostridioides difficile, please send a stool (type 6/7), place the patient in a sideroom if not already in one and commence therapy as per guidelines';
              }
              ugiBleed = 0;
              ngFeed = 0;
              laxatives = 0;
              prokinetics = 0;
              iaPathology = 0;
              //ppi = 0;
            });
          },
          minWidth: MediaQuery.of(context).size.width * 0.13,
          switchColour: kHighlightedToggleYellow,
          firstText: 'No',
          secondText: 'Yes'),
      outputPanelTitle: 'Considerations',
    );
  }
}
