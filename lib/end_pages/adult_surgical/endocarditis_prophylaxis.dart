import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infection/custom_widgets.dart';

class EndocarditisProphylaxis extends StatefulWidget {
  @override
  _EndocarditisProphylaxisState createState() => _EndocarditisProphylaxisState();
}

class _EndocarditisProphylaxisState extends State<EndocarditisProphylaxis> {

  List<Widget> selectionTitles = [
    TickerTile(title: 'Select and operation'),
    TickerTile(title: 'Dental procedures'),
    TickerTile(title: 'Dermatological procedures'),
    TickerTile(title: 'Gastrointestinal procedures'),
    TickerTile(title: 'Genitourinary procedures'),
  ];

  int indexTicker = 0;
  int? abxSelection = 0;

  String antibioticTextOutput = "Select an option";

  List<List<String>> antibioticOutputs =
  [["Select and option","Select and option","Select and option"], //Select Antibiotic
    ["""Prophylaxis NO longer recommended. Chlorhexidine mouthwash as prophylaxis NO longer recommended.
""","""Prophylaxis NO longer recommended. Chlorhexidine mouthwash as prophylaxis NO longer recommended.
""",
      """Prophylaxis NO longer recommended. Chlorhexidine mouthwash as prophylaxis NO longer recommended.
""",
    ],
    ["""Prophylaxis not recommended
""","""Prophylaxis not recommended
""",
      """Prophylaxis not recommended
""",
    ],//dermatological procedures
    ["""Prophylaxis NO longer recommended routinely

EXCEPT:
• In patients with existing genitourinary and/or gastrointestinal tract infections
• In patients who receive perioperative antibiotics to prevent surgical site infection or sepsis
• In patients with an indwelling catheter undergoing a GU procedure (Choice of antibiotic based on MSU C&S, if none available, as below)

 Amoxicillin 1g IV
+ Gentamicin 120mg IV at induction
then Amoxicillin PO 500mg 6hrs later

""","""Prophylaxis NO longer recommended routinely

EXCEPT:
• In patients with existing genitourinary and/or gastrointestinal tract infections
• In patients who receive perioperative antibiotics to prevent surgical site infection or sepsis
• In patients with an indwelling catheter undergoing a GU procedure (Choice of antibiotic based on MSU C&S, if none available, as below)

 Teicoplanin 400mg IV
+ Gentamicin 120mg IV at induction

""",
      """Prophylaxis NO longer recommended routinely

EXCEPT:
• In patients with existing genitourinary and/or gastrointestinal tract infections
• In patients who receive perioperative antibiotics to prevent surgical site infection or sepsis
• In patients with an indwelling catheter undergoing a GU procedure (Choice of antibiotic based on MSU C&S, if none available, as below)

 Teicoplanin 400mg IV
+ Gentamicin 120mg IV at induction

""",
    ],//Gastrointestinal procedures
    ["""Prophylaxis NO longer recommended routinely

EXCEPT:
• In patients with existing genitourinary and/or gastrointestinal tract infections
• In patients who receive perioperative antibiotics to prevent surgical site infection or sepsis
• In patients with an indwelling catheter undergoing a GU procedure (Choice of antibiotic based on MSU C&S, if none available, as below)

 Amoxicillin 1g IV
+ Gentamicin 120mg IV at induction
then Amoxicillin PO 500mg 6hrs later
""","""Prophylaxis NO longer recommended routinely

EXCEPT:
• In patients with existing genitourinary and/or gastrointestinal tract infections
• In patients who receive perioperative antibiotics to prevent surgical site infection or sepsis
• In patients with an indwelling catheter undergoing a GU procedure (Choice of antibiotic based on MSU C&S, if none available, as below)

 Teicoplanin 400mg IV
+ Gentamicin 120mg IV at induction

""",
      """Prophylaxis NO longer recommended routinely

EXCEPT:
• In patients with existing genitourinary and/or gastrointestinal tract infections
• In patients who receive perioperative antibiotics to prevent surgical site infection or sepsis
• In patients with an indwelling catheter undergoing a GU procedure (Choice of antibiotic based on MSU C&S, if none available, as below)

 Teicoplanin 400mg IV
+ Gentamicin 120mg IV at induction
""",
    ],//genitourinary procedures
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
