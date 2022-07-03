import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infection/custom_widgets.dart';

class VascularSurgery extends StatefulWidget {
  @override
  _VascularSurgeryState createState() => _VascularSurgeryState();
}

class _VascularSurgeryState extends State<VascularSurgery> {

  List<Widget> selectionTitles = [
    TickerTile(title: 'Select and operation'),
    TickerTile(title: 'Amputation(infected ± diabetic)'),
    TickerTile(title: 'Amputation (ischaemia not infected)'),
    TickerTile(title: 'Amputation (major trauma'),
  ];

  int indexTicker = 0;

  int? abxSelection = 0;

  String antibioticTextOutput = "Select an option";

  List<List<String>> antibioticOutputs =
  [["Select and option","Select and option","Select and option"], //Select Antibiotic
    ["""At Induction:

 Teicoplanin 10mg/kg (max 1g) IV
+ Ciprofloxacin 400mg IV
+ Metronidazole 500mg IV

Continuation:

 Teicoplanin 10mg/kg (max 1g) IV
+ Ciprofloxacin 400mg IV (or 500mg PO TDS)
+ Metronidazole 500mg IV + Metronidazole 400mg PO TDS for 5-7 days
""","""At Induction:

 Teicoplanin 10mg/kg (max 1g) IV
+ Gentamicin 160mg IV
+ Metronidazole 500mg IV

Continuation:

 Teicoplanin 10mg/kg (max 1g) IV 12-hrly for 2 doses (loading) then OD
+ Gentamicin IV OD (refer to policy)
+ Metronidazole 500mg IV + Metronidazole 400mg PO TDS for 5-7 days
""",
      """At Induction:

 Teicoplanin 10mg/kg (max 1g) IV
+ Ciprofloxacin 400mg IV
+ Metronidazole 500mg IV

Continuation:

 Teicoplanin 10mg/kg (max 1g) IV
+ Ciprofloxacin 400mg IV (or 500mg PO TDS)
+ Metronidazole 500mg IV + Metronidazole 400mg PO TDS for 5-7 days
""",
    ],//Amputation(infected ± diabetic foot)
    [""" Teicoplanin 10mg/kg (max 1g) IV
+ Metronidazole 500mg IV single dose
""",""" Teicoplanin 10mg/kg (max 1g) IV
+ Metronidazole 500mg IV single dose
""",
      """ Teicoplanin 10mg/kg (max 1g) IV
+ Metronidazole 500mg IV single dose
""",
    ],//Amputation(ischaemia not infected)
    ["""At Induction:

 Flucloxacillin 2g IV
+ Benzylpenicillin 1.2g IV
+ Metronidazole 500mg IV

Continuation:

 Flucloxacillin 2g IV QDS
+ Benzylpenicillin 1.2g IV QDS
+ Metronidazole 400mg PO TDS for 5-7 days
""","""At Induction:
 
 Teicoplanin 400mg IV
+ Metronidazole 500mg IV

Continuation:

 Teicoplanin 400mg IV 12-hrly for 2 doses (loading) then 400mg OD
+ Metronidazole 400mg PO TDS for 5-7 days
""",
      """ At Induction:
 
 Teicoplanin 400mg IV
+ Metronidazole 500mg IV

Continuation:

 Teicoplanin 400mg IV 12-hrly for 2 doses (loading) then 400mg OD
+ Metronidazole 400mg PO TDS for 5-7 days
""",
    ],//Amputation(major trauma)
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
      title: 'Vascular Surgery',
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
