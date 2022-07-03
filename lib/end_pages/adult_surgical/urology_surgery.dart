import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infection/custom_widgets.dart';

class UrologySurgery extends StatefulWidget {
  @override
  _UrologySurgeryState createState() => _UrologySurgeryState();
}

class _UrologySurgeryState extends State<UrologySurgery> {

  List<Widget> selectionTitles = [
    TickerTile(title: 'Select and operation'),
    TickerTile(title: 'Catheterisation (short-term)'),
    TickerTile(title: 'Catheterisation (long-term)'),
    TickerTile(title: 'Clean contaminated (use bowel)'),
    TickerTile(title: 'Cystoscopy (complicated)'),
    TickerTile(title: 'Cystoscopy (uncomplicated)'),
    TickerTile(title: 'ESWL'),
    TickerTile(title: 'Nephrectomy'),
    TickerTile(title: 'Nephrostomy'),
    TickerTile(title: 'Prostatectomy'),
    TickerTile(title: 'Radical cystectomy'),
    TickerTile(title: 'Total cystectomy'),
    TickerTile(title: 'TRUS biopsy'),
    TickerTile(title: 'TURBT'),
    TickerTile(title: 'TURP'),
    TickerTile(title: 'Ureteroscopy'),
    TickerTile(title: 'Urethroplasty'),
    TickerTile(title: 'Urethrotomy'),

  ];

  int indexTicker = 0;

  int? abxSelection = 0;

  String antibioticTextOutput = "Select an option";

  List<List<String>> antibioticOutputs =
  [["Select and option","Select and option","Select and option"], //Select Antibiotic
    ["""Antibiotic prophylaxis not required
""","""Antibiotic prophylaxis not required
""",
      """Antibiotic prophylaxis not required
""",
    ],//catheterisation (short term)
    ["""Antibiotic prophylaxis not routinely required. If catheterisation is complicated or achieved after repeated attempts, give Gentamicin IV 160 mg stat.

If systemic signs of infection, treat appropriately. (Refer to previous urine results)
""","""Antibiotic prophylaxis not routinely required. If catheterisation is complicated or achieved after repeated attempts, give Gentamicin IV 160 mg stat.

If systemic signs of infection, treat appropriately. (Refer to previous urine results)
""",
      """Antibiotic prophylaxis not routinely required. If catheterisation is complicated or achieved after repeated attempts, give Gentamicin IV 160 mg stat.

If systemic signs of infection, treat appropriately. (Refer to previous urine results)
""",
    ],//catheterisation (long term)
    [""" Gentamicin IV 160mg STAT

If at high risk of infection (stones & catheterisation or proven UTI) continue with oral Trimethoprim 200mg BD for 5 days(unless sensitivities indicate different)
""",""" Gentamicin IV 160mg STAT

If at high risk of infection (stones & catheterisation or proven UTI) continue with oral Trimethoprim 200mg BD for 5 days(unless sensitivities indicate different)
""",
      """ Teicoplanin 400mg IV
+ Gentamicin 160mg IV STAT

If at high risk of infection (stones & catheterisation or proven UTI) continue with oral Trimethoprim 200mg BD for 5 days(unless sensitivities indicate different)
""",
    ],//change stents
    [""" Co-amoxiclav 1.2g IV STAT
+ Gentamicin 160mg IV
+ Metronidazole 500mg IV single dose
""",""" Teicoplanin 400mg IV
+ Gentamicin 160mg IV
+ Metronidazole 500mg IV single dose
""",
      """ Teicoplanin 400mg IV
+ Gentamicin 160mg IV
+ Metronidazole 500mg IV single dose
""",
    ],//clean contaminated (use bowel)
    [""" Gentamicin IV 160mg STAT

If at high risk of infection (stones & catheterisation or proven UTI) continue with oral Trimethoprim 200mg BD for 5 days(unless sensitivities indicate different)
""",""" Gentamicin IV 160mg STAT

If at high risk of infection (stones & catheterisation or proven UTI) continue with oral Trimethoprim 200mg BD for 5 days(unless sensitivities indicate different)
""",
      """ Teicoplanin 400mg IV
+ Gentamicin 160mg IV STAT

If at high risk of infection (stones & catheterisation or proven UTI) continue with oral Trimethoprim 200mg BD for 5 days(unless sensitivities indicate different)
""",
    ],//cystoscopy(complicated)
    ["""Antibiotic prophylaxis not required
""","""Antibiotic prophylaxis not required
""",
      """Antibiotic prophylaxis not required
""",
    ],//cystocopy (uncomplicated)

    ["""Meropenem IV 1g STAT

If at high risk of infection (stones & catheterisation or proven UTI) continue with oral Trimethoprim 200mg BD for 5 days(unless sensitivities indicate different)
""","""Meropenem IV 1g STAT

If at high risk of infection (stones & catheterisation or proven UTI) continue with oral Trimethoprim 200mg BD for 5 days(unless sensitivities indicate different)
""",
      """ Teicoplanin 400mg IV
+ Meropenem IV 1g STAT

If at high risk of infection (stones & catheterisation or proven UTI) continue with oral Trimethoprim 200mg BD for 5 days(unless sensitivities indicate different)
""",
    ],//ESWL

    [""" Co-amoxiclav IV 1.2g
+ Gentamicin IV 160mg single dose
""",""" Teicoplanin 400mg IV
+ Gentamicin IV 160mg single dose
""",
      """ Teicoplanin 400mg IV
+ Gentamicin IV 160mg single dose
""",
    ],//Nephrectomy

    [""" Gentamicin IV 160mg STAT

If at high risk of infection (stones & catheterisation or proven UTI) continue with oral Trimethoprim 200mg BD for 5 days(unless sensitivities indicate different)
""",""" Gentamicin IV 160mg STAT

If at high risk of infection (stones & catheterisation or proven UTI) continue with oral Trimethoprim 200mg BD for 5 days(unless sensitivities indicate different)
""",
      """ Teicoplanin 400mg IV
+ Gentamicin 160mg IV STAT

If at high risk of infection (stones & catheterisation or proven UTI) continue with oral Trimethoprim 200mg BD for 5 days(unless sensitivities indicate different)
""",
    ],//Nephrostomy

    [""" Co-amoxiclav IV 1.2g
+ Gentamicin IV 160mg single dose
""",""" Teicoplanin 400mg IV
+ Gentamicin IV 160mg single dose
""",
      """ Teicoplanin 400mg IV
+ Gentamicin IV 160mg single dose
""",
    ],//Prostatectomy

    [""" Co-amoxiclav IV 1.2g
+ Gentamicin IV 160mg single dose
""",""" Teicoplanin 400mg IV
+ Gentamicin IV 160mg single dose
""",
      """ Teicoplanin 400mg IV
+ Gentamicin IV 160mg single dose
""",
    ],//Radical Cystectomy

    [""" Co-amoxiclav IV 1.2g
+ Gentamicin IV 160mg single dose
""",""" Teicoplanin 400mg IV
+ Gentamicin IV 160mg single dose
""",
      """ Teicoplanin 400mg IV
+ Gentamicin IV 160mg single dose
""",
    ],//Total cystectomy

    [""" Gentamicin 160mg IV
+ Metronidazole IV 500mg
Followed by Ciprofloxacin PO 500mg BD for 3 days

*Choice of continuation antibiotic should be guided by pre-op urine culture*
""",""" Gentamicin 160mg IV
+ Metronidazole IV 500mg
Followed by Ciprofloxacin PO 500mg BD for 3 days

*Choice of continuation antibiotic should be guided by pre-op urine culture*
""",
      """ Gentamicin 160mg IV
+ Metronidazole IV 500mg
Followed by Ciprofloxacin PO 500mg BD for 3 days

*Choice of continuation antibiotic should be guided by pre-op urine culture*
""",
    ],//TRUS biopsy

    [""" Gentamicin IV 160mg STAT

If at high risk of infection (stones & catheterisation or proven UTI) continue with oral Trimethoprim 200mg BD for 5 days(unless sensitivities indicate different)
""",""" Gentamicin IV 160mg STAT

If at high risk of infection (stones & catheterisation or proven UTI) continue with oral Trimethoprim 200mg BD for 5 days(unless sensitivities indicate different)
""",
      """ Teicoplanin 400mg IV
+ Gentamicin 160mg IV STAT

If at high risk of infection (stones & catheterisation or proven UTI) continue with oral Trimethoprim 200mg BD for 5 days(unless sensitivities indicate different)
""",
    ],//TURBT

    [""" Gentamicin IV 160mg STAT

If at high risk of infection (stones & catheterisation or proven UTI) continue with oral Trimethoprim 200mg BD for 5 days(unless sensitivities indicate different)
""",""" Gentamicin IV 160mg STAT

If at high risk of infection (stones & catheterisation or proven UTI) continue with oral Trimethoprim 200mg BD for 5 days(unless sensitivities indicate different)
""",
      """ Teicoplanin 400mg IV
+ Gentamicin 160mg IV STAT

If at high risk of infection (stones & catheterisation or proven UTI) continue with oral Trimethoprim 200mg BD for 5 days(unless sensitivities indicate different)
""",
    ],//TURP

    [""" Gentamicin IV 160mg STAT

If at high risk of infection (stones & catheterisation or proven UTI) continue with oral Trimethoprim 200mg BD for 5 days(unless sensitivities indicate different)
""",""" Gentamicin IV 160mg STAT

If at high risk of infection (stones & catheterisation or proven UTI) continue with oral Trimethoprim 200mg BD for 5 days(unless sensitivities indicate different)
""",
      """ Teicoplanin 400mg IV
+ Gentamicin 160mg IV STAT

If at high risk of infection (stones & catheterisation or proven UTI) continue with oral Trimethoprim 200mg BD for 5 days(unless sensitivities indicate different)
""",
    ],//Ureteroscopy


    [""" Gentamicin IV 160mg STAT
""",""" Gentamicin IV 160mg STAT
""",
      """Gentamicin 160mg IV STAT
""",
    ],//Urethroplasty

    [""" Gentamicin IV 160mg STAT

If at high risk of infection (stones & catheterisation or proven UTI) continue with oral Trimethoprim 200mg BD for 5 days(unless sensitivities indicate different)
""",""" Gentamicin IV 160mg STAT

If at high risk of infection (stones & catheterisation or proven UTI) continue with oral Trimethoprim 200mg BD for 5 days(unless sensitivities indicate different)
""",
      """ Teicoplanin 400mg IV
+ Gentamicin 160mg IV STAT

If at high risk of infection (stones & catheterisation or proven UTI) continue with oral Trimethoprim 200mg BD for 5 days(unless sensitivities indicate different)
""",
    ],//Urethrotomy
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
      title: 'Urology Surgery',
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
