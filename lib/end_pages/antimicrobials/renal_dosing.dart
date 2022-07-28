import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class RenalDosing extends StatefulWidget {
  @override
  _RenalDosingState createState() => _RenalDosingState();
}

class _RenalDosingState extends State<RenalDosing> {

  List<Widget> selectionTitles = [
    TickerTile(title: 'Select an antibiotic'),
    TickerTile(title: 'Amikacin'),
    TickerTile(title: 'Amoxicillin'),
    TickerTile(title: 'Azithromycin'),
    TickerTile(title: 'Benzylpenicillin'),
    TickerTile(title: 'Cefalexin'),
    TickerTile(title: 'Ceftazifime'),
    TickerTile(title: 'Ceftriaxone'),
    TickerTile(title: 'Cefuroxime'),
    TickerTile(title: 'Chloramphenicol'),
    TickerTile(title: 'Ciprofloxacin'),
    TickerTile(title: 'Clarithromycin'),
    TickerTile(title: 'Clindamycin'),
    TickerTile(title: 'Colistin'),
    TickerTile(title: 'Co-amoxiclav'),
    TickerTile(title: 'Co-trimoxazole'),
    TickerTile(title: 'Daptomycin'),
    TickerTile(title: 'Doxycycline'),
    TickerTile(title: 'Ertapenem'),
    TickerTile(title: 'Erythromycin'),
    TickerTile(title: 'Flucloxacillin'),
    TickerTile(title: 'Fosfomycin'),
    TickerTile(title: 'Fusidic acid'),
    TickerTile(title: 'Gentamicin'),
    TickerTile(title: 'Linezolid'),
    TickerTile(title: 'Meropenem'),
    TickerTile(title: 'Metronidazole'),
    TickerTile(title: 'Moxifloxacin'),
    TickerTile(title: 'Nitrofurantoin'),
    TickerTile(title: 'Penicillin V'),
    TickerTile(title: 'Rifampicin'),
    TickerTile(title: 'Teicoplanin'),
    TickerTile(title: 'Temocillin'),
    TickerTile(title: 'Tigecycline'),
    TickerTile(title: 'Trimethoprim'),
    TickerTile(title: 'Vancomycin'),
  ];

  int indexTicker = 0;



  List <String> antibioticOutputText = [
    """Select an Antibiotic""", //Select Antibiotic
    """Refer to the Dosing and Monitoring section for further information
""",//Amikacin
    """IV and PO Dosing

CrCl > 30mL/min:
• Dose as in normal renal function

CrCl10-30mL/min:
• Dose as in normal renal function

CrCl<10mL/min:
• 250mg - 1g every 8 hours (maximum 6g per day in endocarditis)
""",//Amoxicillin
    """IV and PO Dosing

CrCl > 30mL/min:
• Dose as in normal renal function

CrCl10-30mL/min:
• Dose as in normal renal function

CrCl<10mL/min:
• Dose as in normal renal function
""",//Azithromycin
    """IV Dosing

CrCl20-50mL/min:
• 2.4g 4-hourly

CrCl10-20mL/min:
• 2.4g every 6 hours

CrCl<10mL/min:
• 1.2g every 6 hours
""",//Benzylpenicillin
    """PO Dosing

CrCl > 50mL/min:
• Dose as in normal renal function

CrCl40-50mL/min:
• 1g every 8 hours

CrCl10-40mL/min:
• 500mg every 8 hours

CrCl<10mL/min:
• 250mg every 8 hours
""",//Cefalexin
    """IV Dosing

CrCl > 50mL/min:
• Dose as in normal renal function

CrCl31-50mL/min:
• 1g every 8 hours

CrCl16-30mL/min:
• Loading dose 1g, then 500mg-1g every 12 hours

CrCl5-15mL/min:
• Loading dose 1g, then 250mg-500mg every 12 hours
""",//Ceftazidime
    """IV Dosing

CrCl > 10mL/min:
• Dose as in normal renal function

CrCl<10mL/min:
• Maximum 2g every 24 hours
""",//Ceftiraxone
    """IV Dosing

CrCl > 20mL/min:
• Dose as in normal renal function

CrCl 10-20mL/min:
• 750mg every 12 hours

CrCl<10mL/min:
• 750mg every 12 hours/1.2g every 12 hours

PO Dosing

CrCl > 29mL/min:
• Dose as in normal renal function

CrCl10-29mL/min:
• Standard dose given every 24 hours

CrCl<10mL/min:
• Standard dose given everv 48 hours
""",//Cefuroxime
    """IV Dosing

CrCl > 10mL/min:
• Dose as in normal renal function

CrCl<10mL/min:
• Dose as in normal renal function
 """,//Chlroamphenicol
    """IV Dosing

CrCl > 60mL/min:
• Dose as in normal renal function

CrCl30-60mL/min:
• 200mg-400mg every 12 hours

CrCl<30mL/min:
• 200mg-400mg every 24 hours

PO Dosing

CrCl > 60mL/min:
• Dose as in normal renal function

CrCl30-60mL/min:
• 250mg-500mg every 12 hours

CrCl<30mL/min:
• 250mg-500mg every 24 hours
""",//Ciprofloxacin
    """IV Dosing

CrCl > 30mL/min:
• Dose as in normal renal function

CrCl<30mL/min:
• reduce to half dose

PO Dosing

CrCl > 30mL/min:
• Dose as in normal renal function

CrCl < 30mL/min:
• reduce to half dose
""",//Clarithromycin
    """Dose as in normal renal function""",//Clindamycin
    """IV Dosing

Maintenace dose (start 12 hours after loading dose)

CrCl>85
• Discuss with infection specialist

CrCl75-85mL/min:
• 5.0 million units every 12 hours

CrCl65-75mL/min:
• 4.5 million units every 12 hours

CrCl55-65mL/min:
• 4.0 million units every 12 hours

CrCl45-55mL/min:
• 3.5 million units every 12 hours

CrCl35-45mL/min:
• 3.0 million units every 12 hours

CrCl25-35mL/min:
• 2.5 million units ever 12 hours

CrCl <25
• Discuss with infection specialist

Continuous renal replacement (CVVH)
• Seek advice after giving loading dose
""",//Colistin
    """IV Dosing

CrCl > 30mL/min:
• Dose as in normal renal function

CrCl 10-30mL/min:
• 1.2g every 12 hours

CrCl<10mL/min:
• 1.2g STAT followed by 600mg every 8 hours/1.2g every 12 hours

PO Dosing

Dose as in normal renal function
""",//Co-amoxiclav
    """IV and PO Dosing

CrCl > 30mL/min:
• Dose as in normal renal function

CrCl15-30mL/min:
• 50% of typical dose (non-PCP indications)
• PCP: 120mg/kg iv per day in divided doses for 3 days then 60mg/kg iv per day in divided doses

CrCl<15mL/min:
• Dosing below 15mL/min: is not recommended and should only be given if haemodialysis every 24 hours facilities are available, however:
• 50% of typical dose (non-PCP indications)
• PCP: 60mg/kg iv per day in divided doses

BF recommends performing sulfamethoxazole serum level monitoring. After 2-3 days, plasma samples collected 12 hours post dose should have levels of sulfamethoxazole not higher than 150 micrograms/mL. If higher, stop treatment until levels fall below 120 micrograms/mL
""",//Co-trimoxazole
    """IV Dosing

CrCl > 30/min
• Dose as in normal renal function

CrCl < 30mL/min:
• Dose as in normal renal function but frequency every 48 hours
""",//Daptomycin
    """Dose as in normal renal function
""",//Doxycycline
    """IV Dosing

CrCl30-50mL/min:
• Dose as in normal renal function

CrCl 10-30mL/min:
• 500mg-1 g every 24 hours

CrCl<10mL/min:
• 500mg every 24 hours
""",//Ertapenem
    """Dose as in normal renal function
""",//Erythromycin
    """IV and PO Dosing

CrCl > 30mL/min:
• Dose as in normal renal function

CrCl10-30mL/min:
• Dose as in normal renal function

CrCl<10mL/min:
• Maixmum dose of 4g daily
""",
    """ """,//Flucloxacillin
    """IV Dosing

CrCl > 80mL/min:
• Dose as in normal renal function

CrCl > 40mL/min:
• 70% of usual total daily dose in 2-3 divided doses

CrCl > 30mL/min:
• 60% of usual total daily dose in 2-3 divided doses

CrCl > 20mL/min:
• 40% of usual total daily dose in 2-3 divided doses

CrCl > 10mL/min:
• 20% of usual total daily dose in 1-2 divided doses

PO Dosing

CrCl > 50mL/min:
• 3q once every 48 hours

CrCl10-30mL/min:
• No data: consider 3g every 3 days for complicated UTI

CrC1 < 10ml /min:
• Not recommended
""",//Fosfomycin
    """Dose as in normal renal function
""",//Fusidic Acid
    """Refer to the Dosing and Monitoring section for further information
""",//Gentamicin
    """Dose as in normal renal function
""",//Linezolid
    """IV Dosing

CrCl > 50mL/min:
• Dose as in normal renal function

CrCl26-50mL/min:
• 500mg IV every 6 hours
• CNS or intra-ocular infections 1 gram IV every 8 hours

CrCl10-25mL/min:
• 500mg IV every 12 hours
• CNS or intra-ocular infections 1gram IV every 12 hours

CrCl<10mL/min:
• 500mg IV once-daily
• CNS or intra-ocular infections 500mg every 12 hours
""",//Meropenem
    """Dose as in normal renal function
""",//Metronidazole
    """Dose as in normal renal function
""",//Moxifloxacin
    """PO Dosing

EGFR > 45mL/min:
• Dose as in normal renal function

eGFR30-44mL/min:
• Dose as in normal renal function but use with caution for short course of up to 7 days

CrCl<30mL/min:
• Contraindicated
""",//Nitrofurantoin
    """Dose as in normal renal function
""",//PenicillinV
    """IV and PO Dosing

CrCl20-50mL/min:
• Dose as in normal renal function

CrCl10-20mL/min:
• Dose as in normal renal function

CrCl<10mL/min:
• 50-100% of usual adult dose
""",//Rifampicin
    """IV Dosing

CrCl > 40mL/min:
• Dose as in normal renal function

CrCl20-40mL/min:
• Maximum dose 4.5g every 8 hours

CrCl<20mL/min:
• Maximum dose 4.5g every 12 hours
""",//Tazocin
    """Refer to the Dosing and Monitoring section for further information
""",//Teicoplanin
    """IV Dosing

CrCl>60mL/min:
• Dose as in normal renal function

CrCl30-60mL/min:
• 1g every 12 hours

CrCl10-30mL/min:
• 1g every 24 hours

CrCl<10mL/min:
• 500mg every 24 hours
""",//Temocillin
    """Dose as in normal renal function
""",//Tigecycline
    """PO Dosing

CrCl > 25mL/min:
• Dose as in normal renal function

CrCl15-25mL/min:
• Dose as in normal renal function for THREE days then half the dose


CrCl<10mL/min:
• Half the dose
""",//Trimethoprim
    """PO Dosing

CrCl > 25mL/min:
• Dose as in normal renal function

CrCl15-25mL/min:
• Dose as in normal renal function for THREE days then half the dose

CrCl<10mL/min:
• Half the dose
""",//Vancomycin
  ];



  void notifyParent()
  {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return BloodCulturesEndPage(
        title: "Renal Dosing",
        titleBoxColour: kAntimicrobialMaroon,
        firstTextArea: SubBarAndText(
            //scrollController: ScrollController(initialScrollOffset: 0),
            lowerTitle: "Duration",
            outputText: antibioticOutputText[indexTicker],
            barColour: kAntimicrobialPastelBrown),
        selectionTitles: selectionTitles,
        onSelectedItemChanged: (index)
          {
            setState(() {
              indexTicker = index;
            });
          },

        notifyParent: notifyParent);

  }
}
