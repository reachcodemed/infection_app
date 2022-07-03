import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infection/custom_widgets.dart';

class GastrointestinalEndoscopy extends StatefulWidget {
  @override
  _GastrointestinalEndoscopyState createState() => _GastrointestinalEndoscopyState();
}

class _GastrointestinalEndoscopyState extends State<GastrointestinalEndoscopy> {

  List<Widget> selectionTitles = [
    TickerTile(title: 'Select and operation'),
    TickerTile(title: 'ERCP'),
    TickerTile(title: 'FNA - solid lesions'),
    TickerTile(title: 'FNA - cystic lesions'),
    TickerTile(title: 'PEG insertion'),
  ];

  int indexTicker = 0;

  int? abxSelection = 0;

  String antibioticTextOutput = "Select an option";

  List<List<String>> antibioticOutputs =
  [["Select and option","Select and option","Select and option"], //Select Antibiotic
    ["""Not routinely recommended

Prophylaxis ONLY recommended for the following high risk patient groups; Pancreatic pseudocyst, immunosuppression, neutropenia or advanced haematological malignancy, history of liver transplantation, obstructive jaundice, incomplete biliary drainage as in primary sclerosing cholangitis or hilar cholangiocarcinoma

Teicoplanin 400mg IV
+ Gentamicin 160mg IV
""","""Not routinely recommended

Prophylaxis ONLY recommended for the following high risk patient groups; Pancreatic pseudocyst, immunosuppression, neutropenia or advanced haematological malignancy, history of liver transplantation, obstructive jaundice, incomplete biliary drainage as in primary sclerosing cholangitis or hilar cholangiocarcinoma

Teicoplanin 400mg IV
+ Gentamicin 160mg IV
""",
      """Not routinely recommended

Prophylaxis ONLY recommended for the following high risk patient groups; Pancreatic pseudocyst, immunosuppression, neutropenia or advanced haematological malignancy, history of liver transplantation, obstructive jaundice, incomplete biliary drainage as in primary sclerosing cholangitis or hilar cholangiocarcinoma

Teicoplanin 400mg IV
+ Gentamicin 160mg IV
""",
    ],//ERCP
    ["""Antibiotics not routinely recommended
""",
      """Antibiotics not routinely recommended
""",
      """Antibiotics not routinely recommended
""",
    ],//FNA Solid Lesions
    [""" Co-amoxiclav 1.2g IV single dose
""",
      """ Gentamicin 160mg IV single dose
""",
      """ Gentamicin 160mg IV single dose
""",
    ],//FNA Cystic Lesions

    ["""At induction or immediately before procedure:

 Teicoplanin 400mg IV
+ Gentamicin 160mg IV single dose

""",
      """At induction or immediately before procedure:

 Teicoplanin 400mg IV
+ Gentamicin 160mg IV single dose

""",
      """At induction or immediately before procedure:

 Teicoplanin 400mg IV
+ Gentamicin 160mg IV single dose

""",
    ],//PEG insertion
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

