import 'package:flutter/material.dart';
import 'package:infection/custom_widgets.dart';
import 'package:infection/constants.dart';

class ICsideroomPrioritisation extends StatefulWidget {
  @override
  _ICsideroomPrioritisationState createState() =>
      _ICsideroomPrioritisationState();
}

class _ICsideroomPrioritisationState extends State<ICsideroomPrioritisation> {
  String antibioticTextOutput = '';
  int? ugiBleed = 0;
  int? ngFeed = 0;
  int? laxatives = 0;
  int? prokinetics = 0;
  int? iaPathology = 0;
  int? ppi = 0;
  double minWidth = 60;
  bool tb3isActive = true;

  List<Widget> selectionTitles = [
    TickerTile(title: 'Select an infection'),
    TickerTile(title: 'Avian Influenza'),
    TickerTile(title: 'Chickenpox/Shingles'),
    TickerTile(title: 'Clostridiodes difficile'),
    TickerTile(title: 'Carbapenemase Producer'),
    TickerTile(title: 'Diarrhoea and/or Vomiting'),
    TickerTile(title: 'Enteric Fever (Typhoid/Paratyphoid)'),
    TickerTile(title: 'ESBL'),
    TickerTile(title: 'Enteric Fever (Typhoid/Paratyphoid)'),
    TickerTile(title: 'Fever & Rash Unknown'),
    TickerTile(title: 'GRE'),
    TickerTile(title: 'Group A Streptococcus'),
    TickerTile(title: 'Hepatitis A & E'),
    TickerTile(title: 'Influenza A, B, H1N1'),
    TickerTile(title: 'Measles'),
    TickerTile(title: 'Meningitis'),
    TickerTile(title: 'MRSA'),
    TickerTile(title: 'Mumps'),
    TickerTile(title: 'Prolonged Neutropenia'),
    TickerTile(title: 'Norovirus'),
    TickerTile(title: 'Penicillin-resistant Pneumococcus'),
    TickerTile(title: 'Protective Isolation'),
    TickerTile(title: 'Pseudomonas - Resistant'),
    TickerTile(title: 'Pulmonary Tuberculosis'),
    TickerTile(title: 'Respiratory Viruses'),
    TickerTile(title: 'SARS/MERS'),
    TickerTile(title: 'Viral Haemorrhagic Fever'),
  ];

  int indexTicker1 = 0;
  int indexTicker2 = 0;

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
    return InfectionControlWithTwoSubsections2EndPage(
      pageTitle: 'Side Room Prioritisation',
      antibioticTextOutput: antibioticTextOutput,
      subPanel1Text: 'Currently in Side Room',
      subPanel2Text: 'Proposed for Side Room',
      selectionTitles: selectionTitles,
      selectionTitles2: selectionTitles,
      scroller1: Container(
        color: kInfectionControlBlue,
        child: Container(
          color: Colors.white,
          margin: const EdgeInsets.all(1),
          child: SizedBox(
            width: double.infinity,
            height: 130,
            child: ListWheelScrollView(
              controller: FixedExtentScrollController(
                initialItem: 0,
              ),
              physics: const FixedExtentScrollPhysics(),
              //perspective: 0.01,
              overAndUnderCenterOpacity: 0.3,
              diameterRatio: 1.0,
              magnification: 1.2,
              clipBehavior: Clip.none,
              onSelectedItemChanged: (index) {
                setState(() {
                  indexTicker1 = index;
                  notifyParent();
                });
              },
              itemExtent: 30,
              squeeze: 2,
              children: selectionTitles,
            ),
          ),
        ),
      ),
      scroller2: Container(
        color: kInfectionControlBlue,
        child: Container(
          color: Colors.white,
          margin: const EdgeInsets.all(1),
          child: SizedBox(
            width: double.infinity,
            height: 130,
            child: ListWheelScrollView(
              controller: FixedExtentScrollController(
                initialItem: 0,
              ),
              physics: const FixedExtentScrollPhysics(),
              //perspective: 0.01,
              overAndUnderCenterOpacity: 0.3,
              diameterRatio: 1.0,
              magnification: 1.2,
              clipBehavior: Clip.none,
              onSelectedItemChanged: (index) {
                setState(() {
                  indexTicker2 = index;
                  notifyParent();
                });
              },
              itemExtent: 30,
              squeeze: 2,
              children: selectionTitles,
            ),
          ),
        ),
      ),
      outputPanelTitle: 'Advice',
    );
  }
}
