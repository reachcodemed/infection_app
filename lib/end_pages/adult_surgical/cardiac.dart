import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infection/custom_widgets.dart';

class CardiacSurgery extends StatefulWidget {
  @override
  State<CardiacSurgery> createState() => _CardiacSurgeryState();
}

class _CardiacSurgeryState extends State<CardiacSurgery> {

  int? abxSelection = 0;
  List<Widget> selectionTitles = [
    TickerTile(title:'Select an operation'),
    TickerTile(title:'Cardiac pacemaker insertion'),
  ];

  int indexTicker = 0;
  String antibioticTextOutput = "Select an option";

  List<List<String>> antibioticOutputs =
  [["Select and option","Select and option","Select and option"], //Select Antibiotic
    ["""At Induction:

 Flucloxacillin IV 2g stat

Continuation:

 Flucloxacillin 500mg PO STAT at 6 hours and 12 hours post procedure.
""","""At Induction:

 Teicoplanin IV 400mg
+ Gentamicin IV 160mg
""",
      """At Induction:

 Teicoplanin IV 400mg
+ Gentamicin IV 160mg
""",
    ]//cardiac pacemaker
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
        notifyParent: notifyParent,
        title: 'Endocarditis Prophylaxis',
        selectionTitles: selectionTitles,
        indexTicker: indexTicker,
        abxSelection: abxSelection,
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


