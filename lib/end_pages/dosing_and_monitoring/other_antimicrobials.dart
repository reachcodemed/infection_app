import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class OtherAntimicrobials extends StatefulWidget {
  @override
  _OtherAntimicrobialsState createState() => _OtherAntimicrobialsState();
}

class _OtherAntimicrobialsState extends State<OtherAntimicrobials> {

  List<Widget> selectionTitles = [
    TickerTile(title: 'Select an antimicrobial'),
    TickerTile(title: 'Chloramphenicol'),
    TickerTile(title: 'Coliston'),
    TickerTile(title: 'Cycloserine'),
    TickerTile(title: 'Daptomycin'),
    TickerTile(title: 'Ethambutol'),
    TickerTile(title: 'Flucytosine'),
    TickerTile(title: 'Ganciclovir'),
    TickerTile(title: 'Isavuconazole'),
    TickerTile(title: 'Itraconazole'),
    TickerTile(title: 'Levofloxacin'),
    TickerTile(title: 'Linezolid'),
    TickerTile(title: 'Moxifloxacin'),
    TickerTile(title: 'Posaconazole'),
    TickerTile(title: 'Rifampicin'),
    TickerTile(title: 'Streptomycin'),
    TickerTile(title: 'Tobramycin (OD)'),
    TickerTile(title: 'Tobramycin (BD/TDS)'),
    TickerTile(title: 'Voriconazole'),
  ];

  int indexTicker = 0;

  List<String> antimicrobialInformation = [
    """Select an antimicrobial""",//Select an option
    """Risk group: 
All patients but especially neonates

Expected Levels: 
Pre-dose: ideally <10 mg/L but must be <15mg/L
Post-dose (2h): 10-25 mg/L 

Re-assay interval (days):
5-7

Information taken from Severn Pathology, Antimicrobial Reference Laboratory - Guidelines Ranges for TDM
""",//Chloramphenicol
    """Risk group: 
Patients on IV treatment

Expected Levels: 
Pre-dose: 2-4 mg/L

Re-assay interval (days):
Day 2-3 (if patient received a loading dose)
Re-assay at 5-7 days

Information taken from Severn Pathology, Antimicrobial Reference Laboratory - Guidelines Ranges for TDM
""",//Colistin
    """Risk group: 
All patients after the 4th-6th dose

Expected Levels: 
Pre-dose: 10-20 mg/L
Post-dose (3-4h): 20-35 mg/L, levels to be kept below 35 mg/L  

Re-assay interval (days):
10-30

Information taken from Severn Pathology, Antimicrobial Reference Laboratory - Guidelines Ranges for TDM
""",//Cycloserine
    """Risk group: 
Patients with creatine kinase elevation, high dose therapy (>6mg/kg) or renal impairment

Expected Levels: 
Pre-dose: 5-20 mg/L or 10-20 mg/L in severe sepsis. Pre-dose levels >20 mg/L associated with risk of toxicity

Re-assay interval (days):
6-8 

Information taken from Severn Pathology, Antimicrobial Reference Laboratory - Guidelines Ranges for TDM
""",//Daptomycin
    """Risk group: 
Patients with poor clinical progression or significant renal dysfunction

Expected Levels: 
Pre-dose: <1 mg/L
Post-dose:  2-6 mg/L

Re-assay interval (days):
Depending on levels & progression

Information taken from Severn Pathology, Antimicrobial Reference Laboratory - Guidelines Ranges for TDM
""",//Ethambutol
    """Risk group: 
Routine within 72 hours of starting therapy

Expected Levels: 
Pre-dose: 20-50 mg/L (pre-dose concentrations <20 mg/L have been associated with treatment failure and emergence of resistance)

Post-dose:  50-100mg/L ( =Post dose concentrations > 100 mg/L have been associated with toxicity)

Re-assay interval (days):
4-8 

Information taken from Severn Pathology, Antimicrobial Reference Laboratory - Guidelines Ranges for TDM
""",//Flucytosine
    """Risk group: 
Young children, renal impairment or unstable renal function

Expected Levels: 
Pre-dose: 0.5-1.0 mg/L
Post-dose: 7-9 mg/L (ganciclovir), 5-7 mg/L (valganciclovir)

Re-assay interval (days):
4-8

Information taken from Severn Pathology, Antimicrobial Reference Laboratory - Guidelines Ranges for TDM
""",//Ganciclovir
    """Risk group: 
Not routinely monitored by may be useful in complex cases or in renal impairment

Expected Levels: 
Pre-dose: 1-4 mg/L

Re-assay interval (days):
4-8

Information taken from Severn Pathology, Antimicrobial Reference Laboratory - Guidelines Ranges for TDM
""",//Isavuconazole
    """Risk group: 
Routine in 1st week of therapy. Measure 4-7 days after starting therapy

Expected Levels: 
By chromatographic assay

Pre-dose: 0.5 - 4.0 mg/L (prophylaxis), 1.0-4.0 mg/L (therapy). All pre-dose levels are to be kept below 4.0 mg/L 

Re-assay interval (days):
4-8

Information taken from Severn Pathology, Antimicrobial Reference Laboratory - Guidelines Ranges for TDM
""",//Itraconazole
    """Risk group: 
Patients being treated for MDR TB

Expected Levels: 
Pre-dose: 0.5-2.0 mg/L
Post-dose:  8-13 mg/L

Re-assay interval (days):
Depending on levels and progression

Information taken from Severn Pathology, Antimicrobial Reference Laboratory - Guidelines Ranges for TDM
""",//Levofloxacin
    """Risk group: 
Patients on long term therapy (>28 days) or if on agents with potential drug interactions

Expected Levels: 
Pre-dose: 2-8 mg/L
Post-dose:  12-26 mg/L

Re-assay interval (days):
8-16

Information taken from Severn Pathology, Antimicrobial Reference Laboratory - Guidelines Ranges for TDM
""",//Linezolid
    """Risk group: 
Patients being treated for MDR TB

Expected Levels: 
Pre-dose: 0.3-0.7 mg/L
Post-dose:  3-5 mg/L

Re-assay interval (days): Depending on levels and progression

Information taken from Severn Pathology, Antimicrobial Reference Laboratory - Guidelines Ranges for TDM
""",//Moxifloxacin
    """Risk group: 
Routine in majority of patients. Measure 3-8 days after starting therapy


Expected Levels: 
Pre-dose: 0.7-3.75 mg/L (prophylaxis), 1.0-3.75mg/L (therapy). All pre-dose levels to be kept below 3.75 mg/L

Re-assay interval (days):
4-8

Information taken from Severn Pathology, Antimicrobial Reference Laboratory - Guidelines Ranges for TDM
""",//Posaconazole
    """Risk group: 
Patients with poor clinical progression

Expected Levels: 
Pre-dose: <0.5 mg/L (ideally)
Post-dose:  <4 mg/L (subtherapeutic); 4-8 mg/L (usually adequate); 8-24 mg/L (ideal)

Re-assay interval (days):
Depending on levels & patient progression

Information taken from Severn Pathology, Antimicrobial Reference Laboratory - Guidelines Ranges for TDM
""",//Rifampicin
    """Risk group: 
All patients after 2nd to 4th dose

Expected Levels: (infective endocarditis) 
Pre-dose: <3.0 mg/L
Post-dose:  >10-12 mg/L

Re-assay interval (days):
7-28

Information taken from Severn Pathology, Antimicrobial Reference Laboratory - Guidelines Ranges for TDM
""",//Streptomycin
    """Risk group: 
All patients on 2nd-4th dose; earlier if changing renal function or other risk factors

Expected Levels: 
Pre-dose: <1 mg/L
Post-dose:  >10 mg/L OR 8h post (4.5 mg/kg) 1.5-6 mg/L or follow the Hartford normogram (but this is for 7mg/kg)

Re-assay interval (days):
6-8

Information taken from Severn Pathology, Antimicrobial Reference Laboratory - Guidelines Ranges for TDM
""",//Tobramycin (OD)
    """Risk group: 
All patients on 2nd-4th dose; earlier if changing renal function or other risk factors

Expected Levels: 
Pre-dose: <2 mg/L (Gram-negative pneumonia); <1 mg/L (infective endocarditis)
Post-dose:  >7 mg/L (Gram-negative pneumonia); 3 - ? mg/L (infective endocarditis)

Re-assay interval (days):
3-7

Information taken from Severn Pathology, Antimicrobial Reference Laboratory - Guidelines Ranges for TDM
""",//Tobramycin (BD/TDS)
    """Risk group: 
Routinely within 5 days of starting therapy

Expected Levels: (prophylaxis and therapy)
Pre-dose: 1.0-5.5 mg/L OR 2.0-5.5 for bulky or disseminated infections


Re-assay interval (days):
4-8

Information taken from Severn Pathology, Antimicrobial Reference Laboratory - Guidelines Ranges for TDM
""",//Voriconazole
  ];

  void notifyParent()
  {

  }

  @override
  Widget build(BuildContext context) {
    return BloodCulturesEndPage(
      title: "Other Antimicrobials",
      titleBoxColour: kDosingGreen,
      selectionTitles: selectionTitles,
      onSelectedItemChanged: (index)
        {
          setState(() {
            indexTicker = index;
          });
        },

      notifyParent: notifyParent,

      extraWidget: SizedBox(
        width: double.infinity,
        height: 25,
        child:
        Container(
          alignment: Alignment.centerLeft,
          color: kDosingLightOrange,
          child: const Padding(
            padding: EdgeInsets.fromLTRB(8,0,0,0),
            child: Text('Choose antimicrobial',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 15.0,

              ),),
          ),
        ),
      ),


      firstTextArea:
      SubBarAndText(
          //scrollController: ScrollController(initialScrollOffset: 0),
          lowerTitle: "Advice",
          outputText: antimicrobialInformation[indexTicker],
          barColour: kDosingLightOrange),


    );

  }
}
