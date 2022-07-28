import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class IVOralSwitch extends StatefulWidget {
  @override
  _IVOralSwitchState createState() => _IVOralSwitchState();
}

class _IVOralSwitchState extends State<IVOralSwitch> {

  List<Widget> selectionTitles = [
    TickerTile(title: 'Select an antibiotic'),
    TickerTile(title: 'Amikacin'),
    TickerTile(title: 'Amoxicillin'),
    TickerTile(title: 'Benzylpenicillin'),
    TickerTile(title: 'Cefuroxime'),
    TickerTile(title: 'Ceftazifime'),
    TickerTile(title: 'Ceftriaxone'),
    TickerTile(title: 'Clarithromycin'),
    TickerTile(title: 'Clindamycin'),
    TickerTile(title: 'Ciprofloxacin'),
    TickerTile(title: 'Co-amoxiclav'),
    TickerTile(title: 'Co-trimoxazole'),
    TickerTile(title: 'Ertapenem'),
    TickerTile(title: 'Flucloxacillin'),
    TickerTile(title: 'Fluconazole'),
    TickerTile(title: 'Gentamicin'),
    TickerTile(title: 'Linezolid'),
    TickerTile(title: 'Meropenem'),
    TickerTile(title: 'Piperacillin-Tazobactam'),
    TickerTile(title: 'Teicoplanin'),
    TickerTile(title: 'Tigecycline'),
    TickerTile(title: 'Vancomycin'),
  ];


  List<String> antibioticOutputs = [
    "Select an antibiotic",
    """There is no direct oral conversion for Amikacin, however, if you are treating Pseudomonas, you could use Ciprofloxacin 500 - 750mg BD.

If Ciprofloxacin is prescribed, the patient should be counselled for the side effects of tendinitis and small increased risk of aortic aneurysm and dissection in high-risk patients
""",//amikacin
    """Amoxicillin 500mg - 1g TDS""",//amoxicillin
    """Amoxicillin 500mg - 1g TDS""",//benzylpenicillin
    """Co-amoxiclav 625mg TDS""",//cefuroxime
    """There is no direct oral conversion for Ceftazidime, however, if you are treating Pseudomonas, you could use Ciprofloxacin 500 - 750mg BD""",//ceftazidime
    """There is no direct conversion from Ceftriaxone, but you could use Cefalexin 500mg TDS if there is a sensitivity or Co-amoxiclav 625mg TDS""",//ceftriaxone
    """Clindamycin 500mg BD

The patient should be counselled regarding potential side effect of diarrhorea and to stop the Clindamycin immediately""",//clarithromycin
    """Clindamycin 300 - 450mg QDS

The patient should be counselled regarding potential side effect of diarrhorea and to stop the Clindamycin immediately
""",//clindamycin
    """Ciprofloxacin 500mg - 750mg BD

The patient should be counselled for the side effects of tendinitis and small increased risk of aortic aneurysm and dissection in high-risk patients
""",//ciprofloxacin
    """Co-amoxiclav 625mg TDS""",//co-amoxiclav
    """Co-trimoxazole 960mg BD""",//co-trimoxazole
    """There is no direct oral conversion for Ertapenem, however you could potentially use Ciprofloxacin 500 - 750mg BD or Co-trimoxazole 960mg BD. 

If Ciprofloxacin is prescribed, the patient should be counselled for the side effects of tendinitis and small increased risk of aortic aneurysm and dissection in high-risk patients
""",//ertapenem
    """Flucloxacillin 500mg - 1g QDS""",//flucloxacillin
    """Fluconazole 400mg OD""",//fluconazole
    """There is no direct oral conversion for Gentamicin, however, if you are treating Pseudomonas, you could use Ciprofloxacin 500 - 750mg BD.

If Ciprofloxacin is prescribed, the patient should be counselled for the side effects of tendinitis and small increased risk of aortic aneurysm and dissection in high-risk patients
""",//gentamicin
    """Linezolid 600mg BD (check for drug interactions and counsel patient regarding potential but rare side effects of optic neuritis, bone marrow suppression and peripheral neuropathy""",//linezolid
    """There is no direct oral conversion for Meropenem, however, if you are treating Pseudomonas, you could use Ciprofloxacin 500 - 750mg BD, otherwise use Co-amoxiclav 625mg TDS.

If Ciprofloxacin is prescribed, the patient should be counselled for the side effects of tendinitis and small increased risk of aortic aneurysm and dissection in high risk patients
""",//meropenem
    """There is no direct oral conversion for piperacillin-tazobactam, however, if you are treating Pseudomonas, you could use Ciprofloxacin 500 - 750mg BD, otherwise use Co-amoxiclav 625mg TDS.

If Ciprofloxacin is prescribed, the patient should be counselled for the side effects of tendinitis and small increased risk of aortic aneurysm and dissection in high risk patients
""",//piperacillin-tazobactam
    """Linezolid 600mg BD (check for drug interactions and counsel patient regarding potential but rare side effects of optic neuritis, bone marrow suppression and peripheral neuropathy""",//teicoplanin
    """Discuss with Consultant Microbiologist""",//tigecycline
    """Linezolid 600mg BD (check for drug interactions and counsel patient regarding potential but rare side effects of optic neuritis, bone marrow suppression and peripheral neuropathy""",//vancomycin
  ];


  int indexTicker = 0;



  void notifyParent()
  {

  }

  @override
  Widget build(BuildContext context) {
    return BloodCulturesEndPage(
        title: "IV Oral Switch",
        titleBoxColour: kAntimicrobialMaroon,
        selectionTitles: selectionTitles,
        onSelectedItemChanged: (index)
          {
            setState(() {
              indexTicker = index;
            });
          },
        notifyParent: notifyParent,

        firstTextArea: SubBarAndText(
            //scrollController: ScrollController(initialScrollOffset: 0),
            lowerTitle: "Duration",
            outputText: antibioticOutputs[indexTicker],
            barColour: kAntimicrobialPastelBrown),

        secondTextArea: SubBarAndText(
            //scrollController: ScrollController(initialScrollOffset: 0),
            lowerTitle: "Inclusion and Exclusion Criteria",
            outputText: """Inclusion criteria

• Afebrile: patient afebrile > 24 hours
• Markers: inflammatory markers improving
• Resp rate: <20 for 24 hours
• No unexplained tachycardia
• BP stable for 24 hours

Exclusion criteria

Deep source or complicated infections, particularly in the immunosuppressed""",
            barColour: kIconLightGrey),

       );

  }
}
