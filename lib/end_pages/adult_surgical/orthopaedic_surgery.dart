import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infection/custom_widgets.dart';

class OrthopaedicSurgery extends StatefulWidget {
  const OrthopaedicSurgery({Key? key}) : super(key: key);

  @override
  _OrthopaedicSurgeryState createState() => _OrthopaedicSurgeryState();
}

class _OrthopaedicSurgeryState extends State<OrthopaedicSurgery> {

  List<Widget> selectionTitles = [
    TickerTile(title: 'Select and operation'),
    TickerTile(title: 'Amputation (major trauma)'),
    TickerTile(title: 'Arthroscopy'),
    TickerTile(title: 'First joint replacement'),
    TickerTile(title: 'Neck of femur surgery'),
    TickerTile(title: 'Open/compound fractures'),
    TickerTile(title: 'ORIF closed fractures'),
    TickerTile(title: 'Revision joint replacement'),
    TickerTile(title: 'Spinal surgery'),
  ];

  int indexTicker = 0;

  int? abxSelection = 0;

  String antibioticTextOutput = "Select an option";

  List<List<String>> antibioticOutputs =
  [["Select and option","Select and option","Select and option"], //Select Antibiotic
    ["""At induction:

 Flucloxacillin 2g IV
+ Benzylpenicillin 1.2g IV
+ Gentamicin 5mg/kg IV
+ Metronidazole 500mg IV

Continuation:

 Flucloxacillin 1g IV 6-hourly
+ Benzylpenicillin 1.2g IV 6-hourly
+ Metronidazole 400mg PO 8-hourly for 5-7 days
""","""At Induction:

 Teicoplanin 400mg IV
+ Gentamicin 5mg/kg IV
+ Metronidazole 500mg IV

Continuation (if required):

 Teicoplanin 400mg IV 12-hrly for 2 doses (loading) then
400mg IV OD
+ Metronidazole 400mg PO 8-hourly for 5-7 days
""",
      """At Induction:

 Teicoplanin 400mg IV
+ Gentamicin 5mg/kg IV
+ Metronidazole 500mg IV

Continuation (if required):

 Teicoplanin 400mg IV 12-hrly for 2 doses (loading) then
400mg IV OD
+ Metronidazole 400mg PO 8-hourly for 5-7 days
""",
    ],//Amputation (major trauma)
    ["""Antibiotics not routinely indicated
""","""Antibiotics not routinely indicated
""",
      """Antibiotics not routinely indicated
""",
    ],//Arthroscopy
    ["""At induction:

 Flucloxacillin 2g IV
+ Benzylpenicillin 1.2g IV
+ Gentamicin 5mg/kg IV

Continuation:

 Flucloxacillin 1g IV 6-hourly
+ Benzylpenicillin 1.2g IV 6-hourly × 3 doses of each
""","""At Induction:

 Teicoplanin 400mg IV
+ Gentamicin 160mg IV

Continuation:

 Teicoplanin 400mg IV 12 hrs later

""",
      """At Induction:

 Teicoplanin 400mg IV
+ Gentamicin 160mg IV

Continuation:

 Teicoplanin 400mg IV 12 hrs later

""",
    ],//First Joint Replacement
    ["""At Induction:

 Teicoplanin 400mg IV
+ Gentamicin 160mg IV

Continuation:

 Teicoplanin 400mg IV 12 hrs later
""","""At Induction:

 Teicoplanin 400mg IV
+ Gentamicin 160mg IV

Continuation:

 Teicoplanin 400mg IV 12 hrs later
""",
      """At Induction:

 Teicoplanin 400mg IV
+ Gentamicin 160mg IV

Continuation:

 Teicoplanin 400mg IV 12 hrs later
""",
    ],//Neck of Femur Surgery
    ["""At induction:

 Flucloxacillin 2g IV
+ Benzylpenicillin 1.2g IV
+ Gentamicin 5mg/kg IV
+ Metronidazole 500mg IV

Continuation:

 Flucloxacillin 1g IV 6-hourly
+ Benzylpenicillin 1.2g IV 6-hourly
+ Metronidazole 400mg PO 8-hourly for 5-7 days
""","""At Induction:

 Teicoplanin 400mg IV
+ Gentamicin 5mg/kg IV
+ Metronidazole 500mg IV

Continuation (if required):

 Teicoplanin 400mg IV 12-hrly for 2 doses (loading) then
400mg IV OD
+ Metronidazole 400mg PO 8-hourly for 5-7 days
""",
      """At Induction:

 Teicoplanin 400mg IV
+ Gentamicin 5mg/kg IV
+ Metronidazole 500mg IV

Continuation (if required):

 Teicoplanin 400mg IV 12-hrly for 2 doses (loading) then
400mg IV OD
+ Metronidazole 400mg PO 8-hourly for 5-7 days
""",
    ],//Open Compound Fractures

    ["""At Induction:

 Teicoplanin 400mg IV
+ Gentamicin 5mg/kg IV
+ Metronidazole 500mg IV

Continuation (if required):

 Teicoplanin 400mg IV 12-hrly for 2 doses (loading) then
400mg IV OD
+ Metronidazole 400mg PO 8-hourly for 5-7 days
""","""At Induction:

 Teicoplanin 400mg IV
+ Gentamicin 160mg IV

Continuation:

 Teicoplanin 400mg IV 12 hrs later
""",
      """At Induction:

 Teicoplanin 400mg IV
+ Gentamicin 160mg IV

Continuation:

 Teicoplanin 400mg IV 12 hrs later
""",
    ],//ORIF Closed Fractures

    ["""At Induction:

 Teicoplanin 400mg IV
+ Gentamicin 160mg IV

Continuation:
 Teicoplanin 400mg IV 12 hrs later
""","""At Induction:

 Teicoplanin 400mg IV
+ Gentamicin 160mg IV

Continuation:

 Teicoplanin 400mg IV 12 hrs later
""",
      """At Induction:

 Teicoplanin 400mg IV
+ Gentamicin 160mg IV

Continuation:

 Teicoplanin 400mg IV 12 hrs later
""",
    ],//Revision Joint Replacement

    [""" Flucloxacillin 2g IV
+ Gentamicin 5mg/Kg IV single dose
""",""" Teicoplanin 400mg IV
+ Gentamicin 5mg/kg IV single dose
""",
      """ Teicoplanin 400mg IV
+ Gentamicin 5mg/kg IV single dose
""",
    ],//Spinal Surgery


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
      title: 'Orthopaedic surgery',
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
