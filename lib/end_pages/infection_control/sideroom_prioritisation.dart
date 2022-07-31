import 'package:flutter/material.dart';
import 'package:infection/custom_widgets.dart';
import 'package:infection/constants.dart';

class Pathogen {
  String title = '';
  int value = 0;
  String notes = '';
  String clean = '';

  Pathogen(String title, int value, String notes, String clean) {
    this.title = title;
    this.value = value;
    this.notes = notes;
    this.clean = clean;
  }
}

class ICsideroomPrioritisation extends StatefulWidget {
  @override
  _ICsideroomPrioritisationState createState() =>
      _ICsideroomPrioritisationState();
}

class _ICsideroomPrioritisationState extends State<ICsideroomPrioritisation> {
  String antibioticTextOutput = '';

  List<Widget> selectionTitles = [
    TickerTile(title: 'Select an infection'),
    TickerTile(title: 'Avian Influenza'),
    TickerTile(title: 'Chickenpox/Shingles'),
    TickerTile(title: 'Clostridiodes difficile'),
    TickerTile(title: 'Carbapenemase Producer'),
    TickerTile(title: 'Diarrhoea and/or Vomiting'),
    TickerTile(title: 'Enteric Fever (Typhoid/Paratyphoid)'),
    TickerTile(title: 'ESBL'),
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

  List<Pathogen> pathogens = [
    Pathogen("Avian Influenza", 1,
        "The patient must be in a negative pressure sideroom", "RED"),
    Pathogen("SARS/MERS", 1,
        "The patient must be in a negative pressure sideroom", "RED"),
    Pathogen(
        "Viral Haemorrhagic Fever", 2, "Isolate until VHF excluded", "RED"),
    Pathogen(
        "Pulmonary Tuberculosis",
        3,
        "Confirmed or suspected open pulmonary TB – negative pressure preferable (essential if MDR TB risk). Isolation may cease 2 weeks after start of chemotherapy with agreement of chest physicians",
        "RED"),
    Pathogen("Measles", 4,
        "Isolate until 7 days after the appearance of the rash", "AMBER"),
    Pathogen(
        "Mumps", 5, "Isolate until 9 days after onset of swelling", "AMBER"),
    Pathogen("Chickenpox/Shingles", 6, "Isolate until lesions are dry/crusted",
        "RED"),
    Pathogen("Fever & Rash Unknown", 7,
        "Isolate until rash has been diagnosed as non-infectious", "AMBER"),
    Pathogen(
        "Prolonged Neutropenia",
        8,
        "To remain in sideroom and protective isolation until neutrophil count recovers",
        "AMBER"),
    Pathogen("Meningitis", 9,
        "Isolate until 24 hours after start of appropriate treatment", "AMBER"),
    Pathogen("Carbapenemase Producer", 10, "Isolate until discharge", "RED"),
    Pathogen(
        "Norovirus", 11, "Isolate until free of symptoms for 48 hours", "RED"),
    Pathogen("Clostridiodes difficile", 12,
        "Isolate until free of symptoms for 48 hours", "RED"),
    Pathogen(
        "Diarrhoea and/or Vomiting",
        13,
        "Risk assess e.g. explosive diarrhoea, is the patient vomiting, any staff with symptoms?",
        "AMBER"),
    Pathogen(
        "Enteric Fever (Typhoid/Paratyphoid)",
        13,
        "Risk assess e.g. explosive diarrhoea, is the patient vomiting, any staff with symptoms?",
        "AMBER"),
    Pathogen("Hepatitis A & E", 14,
        "Isolation not necessary once the patient is jaundiced", "AMBER"),
    Pathogen(
        "Influenza A, B, H1N1",
        15,
        "Isolation to cease 7 days after onset of symptoms. For immunocompromised patients discuss with Consultant Microbiologist/Infection Control Team",
        "AMBER"),
    Pathogen(
        "Group A Streptococcus",
        16,
        "Isolation to cease once patients has had 24 hours of appropriate antibiotics/until repeat swab is negative",
        "AMBER"),
    Pathogen(
        "Respiratory Viruses",
        17,
        "Isolation to cease 5 days after onset of symptoms. For immunocompromised patients discuss with Consultant Microbiologist/Infection Control Team",
        "AMBER"),
    Pathogen("Pseudomonas - Resistant", 18, "Isolate until discharge", "RED"),
    Pathogen(
        "Penicillin-resistant Pneumococcus",
        19,
        "Isolate if patient is productive of sputum and until they have had 48 hours of appropriate antibiotics",
        "AMBER"),
    Pathogen(
        "MRSA",
        20,
        "Risk assess e.g. isolate if MRSA in sputum and very productive or has eczema, weeping wounds etc",
        "AMBER"),
    Pathogen(
        "ESBL",
        21,
        "Risk assess e.g. isolate if coliform in sputum and very productive, or if highly resistant e.g. sensitive to Colistin only",
        "AMBER"),
    Pathogen("GRE", 21,
        "Risk assess e.g. isolate if VRE in sputum and very productive", "RED"),
    Pathogen(
        "Protective Isolation",
        22,
        "Risk assess e.g. isolate if coliform in sputum and very productive, or if highly resistant e.g. sensitive to Colistin only",
        "AMBER"),
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
                if (index == 0) {
                } else {
                  setState(() {
                    indexTicker1 = index;
                    notifyParent();
                    priorityCheck(indexTicker1, indexTicker2);
                  });
                }
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
                if (index == 0) {
                } else {
                  setState(() {
                    indexTicker2 = index;
                    notifyParent();
                    priorityCheck(indexTicker1, indexTicker2);
                  });
                }
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

  void priorityCheck(int pathogen, int pathogen2) {
    if (pathogen == 0 || pathogen2 == 0) {
    } else {
      if (pathogen == pathogen2) {
        antibioticTextOutput =
            'Both of these patients have the same infection.\n\nDiscuss with infection control to see which patient takes priority';
      } else {
        //antibioticTextOutput = 'Are you coming here?';
        TickerTile temp = selectionTitles[pathogen] as TickerTile;
        String sTemp = temp.title;
        int chosen1 = 0;

        TickerTile temp2 = selectionTitles[pathogen2] as TickerTile;
        String sTemp2 = temp2.title;
        int chosen2 = 0;

        for (int i = 0; i < selectionTitles.length - 1; i++) {
          if (sTemp == pathogens[i].title) {
            chosen1 = i;
          }
        }

        for (int j = 0; j < selectionTitles.length - 1; j++) {
          if (sTemp2 == pathogens[j].title) {
            chosen2 = j;
          }
        }

        if (pathogens[chosen1].value < pathogens[chosen2].value) {
          if (pathogens[chosen1].clean == 'AMBER') {
            antibioticTextOutput = sTemp +
                ' takes priority for the side room \n\n${pathogens[chosen1].notes} \n\nAn ${pathogens[chosen1].clean} clean will be required';
          } else {
            antibioticTextOutput = sTemp +
                ' takes priority for the side room \n\n${pathogens[chosen1].notes} \n\nA ${pathogens[chosen1].clean} clean will be required';
          }
        } else {
          if (pathogens[chosen2].clean == 'AMBER') {
            antibioticTextOutput = sTemp2 +
                ' takes priority for the side room \n\n${pathogens[chosen2].notes} \n\nAn ${pathogens[chosen2].clean} clean will be required';
          } else {
            antibioticTextOutput = sTemp2 +
                ' takes priority for the side room \n\n${pathogens[chosen2].notes} \n\nA ${pathogens[chosen2].clean} clean will be required';
          }
        }
      }
    }
  }
}
