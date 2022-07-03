import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infection/custom_widgets.dart';

class LowerGISurgery extends StatefulWidget {
  const LowerGISurgery({Key? key}) : super(key: key);

  @override
  _LowerGISurgeryState createState() => _LowerGISurgeryState();
}

class _LowerGISurgeryState extends State<LowerGISurgery> {

  List<Widget> selectionTitles = [
    TickerTile(title: 'Select and operation'),
    TickerTile(title: 'Appendicectomy'),
    TickerTile(title: 'Colorectal (uncomplicated)'),
    TickerTile(title: 'Hernia repair (laparoscopic)'),
    TickerTile(title: 'Hernia repair (open)'),
    TickerTile(title: 'Perforation/faecal peritonitis'),
    TickerTile(title: 'Resections in IBD'),
    TickerTile(title: 'Small bowel (uncomplicated)'),
  ];

  int indexTicker = 0;

  int? abxSelection = 0;

  String antibioticTextOutput = "Select an option";

  List<List<String>> antibioticOutputs =
  [["Select and option","Select and option","Select and option"], //Select Antibiotic
    ["""At Induction:

 Cefuroxime 1.5mg IV
+ Metronidazole 500mg IV
""","""At Induction:

Teicoplanin 400mg IV
+ Gentamicin 160mg IV
+ Metronidazole 500mg IV single dose
""",
      """At Induction:

Teicoplanin 400mg IV
+ Gentamicin 160mg IV
+ Metronidazole 500mg IV single dose
""",
    ],//appendicectomy
    ["""At Induction:

 Cefuroxime 1.5mg IV
+ Metronidazole 500mg IV
""","""At Induction:

Teicoplanin 400mg IV
+ Gentamicin 160mg IV
+ Metronidazole 500mg IV single dose
""",
      """At Induction:

Teicoplanin 400mg IV
+ Gentamicin 160mg IV
+ Metronidazole 500mg IV single dose
""",
    ],//Colorectal (uncomplicated)

    ["""If antibiotics required:

 Flucloxacillin 1g IV
or Cefuroxime 1.5g IV single dose

""","""If antibiotics required:

 Teicoplanin IV 400mg single dose
""",
      """If antibiotics required:

 Teicoplanin IV 400mg single dose
""",
    ],//Hernia repair (laparoscopic)
    ["""At Induction:

 Cefuroxime 1.5mg IV
+ Metronidazole 500mg IV
""","""At Induction:

Teicoplanin 400mg IV
+ Gentamicin 160mg IV
+ Metronidazole 500mg IV single dose
""",
      """At Induction:

Teicoplanin 400mg IV
+ Gentamicin 160mg IV
+ Metronidazole 500mg IV single dose
""",
    ],//Hernia repair (open)

    ["""At Induction:

 Co-amoxiclav 1.2g IV
+ Gentamicin IV
+ Metronidazole 500mg IV

Continuation:

 Co-amoxiclav 1.2g IV TDS
+ Gentamicin IV
+ Metronidazole 500mg IV TDS for 3 days and then review

""","""At Induction:

 Teicoplanin 400mg IV
+ Gentamicin 160mg IV
+ Metronidazole 500mg IV

Continuation (if required):

 Teicoplanin 400mg IV 12-hrly for 2 doses (loading) then OD
+ Gentamicin 5mg/kg IV OD
+ Metronidazole 500mg IV 8-hourly for 3 days and review

""",
      """At Induction:

 Piperacillin-Tazobactam 4.5g IV
+ Teicoplanin 400 mg IV
+ Metronidazole 500mg IV

Continuation:

 Piperacillin-Tazobactam 4.5g IV
+ Teicoplanin 400mg IV 12-hrly for 2 doses (loading) then OD
+ Metronidazole 500mg IV TDS for 3 days and then review

Add Gentamicin 5mg/kg IV OD in patients with severe sepsis

""",
    ],//Perforation/faecal peritonitis

    ["""At Induction:

Cefuroxime 1.5mg IV
+ Metronidazole 500mg IV
""","""At Induction:

Teicoplanin 400mg IV
+ Gentamicin 160mg IV
+ Metronidazole 500mg IV single dose
""",
      """At Induction:

Teicoplanin 400mg IV
+ Gentamicin 160mg IV
+ Metronidazole 500mg IV single dose
""",
    ],//Resection in IBD
    ["""At Induction:

Cefuroxime 1.5mg IV
+ Metronidazole 500mg IV
""","""At Induction:

Teicoplanin 400mg IV
+ Gentamicin 160mg IV
+ Metronidazole 500mg IV single dose
""",
      """At Induction:

Teicoplanin 400mg IV
+ Gentamicin 160mg IV
+ Metronidazole 500mg IV single dose
""",
    ],//Small Bowel (Uncomplicated)

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
      title: 'Lower GI Surgery',
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
