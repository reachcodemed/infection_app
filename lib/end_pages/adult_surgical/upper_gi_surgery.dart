import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infection/custom_widgets.dart';

class UpperGISurgery extends StatefulWidget {
  @override
  _UpperGISurgeryState createState() => _UpperGISurgeryState();
}

class _UpperGISurgeryState extends State<UpperGISurgery> {

  List<Widget> selectionTitles = [
    TickerTile(title: 'Select and operation'),
    TickerTile(title: 'Cholecystectomy (laparoscopic)'),
    TickerTile(title: 'Cholecystectomy (open)'),
    TickerTile(title: 'Gastroduodenal surgery'),
  ];

  int indexTicker = 0;

  int? abxSelection = 0;

  String antibioticTextOutput = "Select an option";

  List<List<String>> antibioticOutputs =
  [["Select and option","Select and option","Select and option"], //Select Antibiotic
    ["""Antibiotics not routinely recommended. Prophylaxis should be considered in high risk patients, eg. age >60yrs, intraoperative cholangiogram, bile spillage, conversion to laparotomy / open cholecystectomy, acute cholecystitis / pancreatitis, jaundice, pregnancy, immunosuppression, insertion of prosthetic devices, stones in CBD, those who have had previous biliary surgery.
""","""Antibiotics not routinely recommended. Prophylaxis should be considered in high risk patients, eg. age >60yrs, intraoperative cholangiogram, bile spillage, conversion to laparotomy / open cholecystectomy, acute cholecystitis / pancreatitis, jaundice, pregnancy, immunosuppression, insertion of prosthetic devices, stones in CBD, those who have had previous biliary surgery.
""",
      """Antibiotics not routinely recommended. Prophylaxis should be considered in high risk patients, eg. age >60yrs, intraoperative cholangiogram, bile spillage, conversion to laparotomy / open cholecystectomy, acute cholecystitis / pancreatitis, jaundice, pregnancy, immunosuppression, insertion of prosthetic devices, stones in CBD, those who have had previous biliary surgery.
""",
    ],//cholecystectomy (laparoscopic)
    ["""At Induction:

 Amoxicillin IV 1g
+ Gentamicin 160mg IV
+ Metronidazole 500mg IV single dose
""","""At Induction:

 Teicoplanin IV 400mg
+ Gentamicin 160mg IV
+ Metronidazole 500mg IV single dose
""",
      """At Induction:

 Teicoplanin IV 400mg
+ Gentamicin 160mg IV
+ Metronidazole 500mg IV single dose
""",
    ],//cholecystectomy (open)
    ["""At Induction:

 Cefuroxime 1.5mg IV
+ Metronidazole IV 500mg
""","""At Induction:

 Teicoplanin IV 400mg
+ Gentamicin 160mg IV
+ Metronidazole 500mg IV single dose
""",
      """At Induction:

 Teicoplanin IV 400mg
+ Gentamicin 160mg IV
+ Metronidazole 500mg IV single dose
""",
    ],//Gastroduodenal surgery
  ];

  void notifyParent()
  {
    for(int i = 0; i < selectionTitles.length;i++)
    {
      if (i == indexTicker)
      {
        if(abxSelection == 0)
        {
          antibioticTextOutput = antibioticOutputs[i][0];
        }
        else if (abxSelection ==1)
        {
          antibioticTextOutput = antibioticOutputs[i][1];
        }
        else if (abxSelection == 2)
        {
          antibioticTextOutput = antibioticOutputs[i][2];
        }
        else
        {

        }
      }
      else
      {

      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SurgicalProphylaxisEndPage(
      title: 'Gastrointestinal Endoscopy',
      selectionTitles: selectionTitles,
      indexTicker: indexTicker,
      abxSelection: abxSelection,
      notifyParent: notifyParent,
      antibioticTextOutput: antibioticTextOutput,
      onValueChanged: (index)
      {
        setState(() {
          abxSelection = index;
          notifyParent();
        });

      },
      onSelectedItemChanged: (index)
      {
        setState(() {
          indexTicker = index;
          notifyParent();
        });
      },
    );
  }
}
