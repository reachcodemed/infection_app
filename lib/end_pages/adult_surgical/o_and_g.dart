import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infection/custom_widgets.dart';

class GynaecologyAndObstetrics extends StatefulWidget {
  const GynaecologyAndObstetrics({Key? key}) : super(key: key);

  @override
  _GynaecologyAndObstetricsState createState() => _GynaecologyAndObstetricsState();
}

class _GynaecologyAndObstetricsState extends State<GynaecologyAndObstetrics> {

  List<Widget> selectionTitles = [
    TickerTile(title: 'Select and operation'),
    TickerTile(title: 'Ceasarean section'),
    TickerTile(title: 'ERPC'),
    TickerTile(title: 'Hysterectomy'),
    TickerTile(title: 'Insertion of IUD'),
    TickerTile(title: 'Myomectomy'),
    TickerTile(title: 'Perineal tear (3/4th degree'),
    TickerTile(title: 'Vaginal termination of pregnancy',),
  ];

  int indexTicker = 0;

  int? abxSelection = 0;

  String antibioticTextOutput = "Select an option";

  List<List<String>> antibioticOutputs =
  [["Select and option","Select and option","Select and option"], //Select Antibiotic
    ["""As soon as umbilical cord clamped:

 Cefuroxime 1.5mg IV
+ Metronidazole 500mg IV

Continuation (if required):

 Cefuroxime 750mg IV
+ Metronidazole 400mg PO TDS for 24 hrs
""",
      """As soon as umbilical cord clamped:

 Clindamycin 600mg IV
+ Gentamicin 160mg IV

Continuation (if required):

 Clindamycin 600mg IV QDS
+ Gentamicin 160mg IV OD for 24 hrs
""",
      """As soon as umbilical cord clamped:

 Teicoplanin 400mg IV
+ Gentamicin 160mg IV
+ Metronidazole 500mg IV

Continuation (if required):

 Teicoplanin 400mg IV 12 hrs later
+ Gentamicin 160mg IV OD
+ Metronidazole 400mg PO TDS for 24 hours

""",
    ],//Caesarean section

    ["""Antibiotics not routinely recommended
""",
      """Antibiotics not routinely recommended
""",
      """Antibiotics not routinely recommended
""",
    ],//ERPC

    ["""At induction or immediately before procedure:

 Cefuroxime 1.5mg IV
+ Metronidazole 500mg IV

Continuation (if required):

 Cefuroxime 750mg IV
+ Metronidazole 400mg PO TDS for 24 hrs

""",
      """At induction or immediately before procedure:

 Gentamicin 160mg IV
+ Metronidazole 500mg IV

Continuation (if required):

 Gentamicin IV OD
+ Metronidazole 400mg PO TDS for 24 hrs

""",
      """At induction or immediatelv before procedure:

 Teicoplanin 400mg IV

Continuation:

 Teicoplanin 400mg 12 hrs later

""",
    ],//Hysterectomy

    ["""Antibiotics not routinely recommended
""",
      """Antibiotics not routinely recommended
""",
      """Antibiotics not routinely recommended
""",
    ],//Insertion of IUD

    ["""At induction or immediately before procedure:

 Cefuroxime 1.5mg IV
+ Metronidazole 500mg IV

Continuation (if required):

 Cefuroxime 750mg IV
+ Metronidazole 400mg PO TDS for 24 hrs
""",
      """At induction or immediately before procedure:

 Gentamicin 160mg IV
+ Metronidazole 500mg IV

Continuation (if required):

 Gentamicin IV OD
+ Metronidazole 400mg PO TDS for 24 hrs
""",
      """At induction or immediately before procedure:

 Teicoplanin 400mg IV

Continuation:

 Teicoplanin 400mg 12 hrs later

""",
    ],//Myomectomy

    [""" Co-amoxiclav IV 1.2g commenced intra-operatively and switched to:

 Co-amoxiclav PO 625mg TDS for 3 days
""",
      """Mild Allergy:

 Cefuroxime IV 1.5g
+ Metronidazole IV 500mg commenced intra-operatively and switched to:

 Cefalexin PO 500mg TDS
+ Metronidazole PO 400mg TDS for 3 days

Severe Allergy:

 Clindamycin IV 900mg
+ Ciprofloxacin IV 400mg commenced intra-operatively and switched to:

 Clindamycin PO 300mg QDS
+ Ciprofloxacin 500mg BS for 3 days
""",
      """ Teicoplanin IV 400mg
+ Gentamicin IV 160mg
+ Metronidazole IV 500mg commenced intra-operatively

Discuss PO switch with Microbiologist
""",
    ],//Perineal Tear (3rd/4th Degree)

    ["""Metronidazole 1g PR
+ Doxycycline 100mg BD for 10/7
""",
      """Metronidazole 1g PR
+ Doxycycline 100mg BD for 10/7
""",
      """Metronidazole 1g PR
+ Doxycycline 100mg BD for 10/7
""",
    ],//Vaginal termination of pregnancy
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
      title: 'Gynaecology & Obstetrics',
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
