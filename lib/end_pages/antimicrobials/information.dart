import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class AntimicrobialInformation extends StatefulWidget {
  @override
  _AntimicrobialInformationState createState() => _AntimicrobialInformationState();
}

class _AntimicrobialInformationState extends State<AntimicrobialInformation> {

  List<Widget> selectionTitles = [
    TickerTile(title: 'Select an antibiotic'),
    TickerTile(title: 'Amikacin'),
    TickerTile(title: 'Amoxicillin'),
    TickerTile(title: 'Amphotericin'),
    TickerTile(title: 'Anidulafungin'),
    TickerTile(title: 'Azithromycin'),
    TickerTile(title: 'Benzylpenicillin'),
    TickerTile(title: 'Caspofungin'),
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
    TickerTile(title: 'Fluconazole'),
    TickerTile(title: 'Fidaxomicin'),
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
    TickerTile(title: 'Piperacillin-tazobactam'),
    TickerTile(title: 'Teicoplanin'),
    TickerTile(title: 'Temocillin'),
    TickerTile(title: 'Tigecycline'),
    TickerTile(title: 'Trimethoprim'),
    TickerTile(title: 'Vancomycin'),
    TickerTile(title: 'Voriconazole'),
  ];

  int indexTicker = 0;

  List<List<String>> antibioticInformationOutputs = [
    ["","",""],
    ["""Intravenous: Amikacin is given intravenously at 15mg/kg

Please use the amikacin calculator in the therapeutic dose monitoring section
""","""Levels are processed at St George’s Hospital. Please ring in advice to notify them. Follow trust amikacin therapeutic dose monitoring guidance""","""Use with microbiology advice only, when benefit outweighs risk. Aminoglycoside dosing and monitoring is more complex in pregnant patients. Potential risk of auditory and vestibular nerve damage in the infant""",],//Amikacin
    ["""Oral: 500mg-1000mg TDS
Intravenous: 2000mg TDS

Listeria meningitis IV 2000mg every 4 hours
""","""Gram-positive and some Gram-negative cover. Cover for UTI is limited by resistance. Only use where sensitivities indicate""","""Not known to be harmful""",],//Amoxicillin
    ["""Intravenous: 5mg/kg OD""","""Microbiology approval is required. Need 1mg test dose over 10 mins before the first dose & observe for 30 mins for signs of allergy/anaphylaxis""","""Not known to be harmful, but manufacturers advise to avoid unless the potential benefit outweighs the risk""",],//Amphotericin
    ["""Intravenous: 200mg OD for 1 day, the 100mg OD""","""ITU use where fluconazole is inappropriate. No dose adjustment for renal or hepatic impairment""","""Manufacturer advises to avoid - no information available""",],//Anidulafungin
    ["""Oral: 500mg OD""","""Gram-positive, atypical cover & limited Gram-negative cover (Haemophilus & Moraxella). Used mostly for genitourinary infections & respiratory-tract infections""","""Manufacturers advise to use only if adequate alternatives are not available""",],//Azithromycin
    ["""Intravenous: 1.2g-2.4g QDS to 4 hourly""","""Narrow spectrum cover for Gram-positives including Streptococci. Has limited anaerobic cover""","""Not known to be harmful""",],//Benzylpenicillin
    ["""Intravenous: If weight < 81kg then 70mg OD for 1 day then 50mg OD
If weight > 80kg then 70mg OD
""","""Microbiology approval is required. Dose adjust for hepatic impairment""","""Manufacturer advises to avoid unless essential - toxicity in animal studies """,],//Caspofungin
    ["""Oral: 500mg 8-12 hours; increased to 1000mg-1500mg every 6-8 hours""","""Gram-positive and Gram-negative cover. May not be suitable for severe systemic infection""","""Not known to be harmful""",],//Cefalexin
    ["""Intravenous: 2g every 8-12 hours""","""Broad spectrum Gram-positive and Gram-negative cover including cover for Pseudomonas. Increased risk of Clostridioides difficile""","""Not known to be harmful""",],//Ceftazidime
    ["""Intravenous: 1-2g OD increased to 2g BD for central nervous system infections""","""Broad spectrum Gram-positive and Gram-negative cover. Increased risk of Clostridioides difficile""","""Manufacturer advises use only if benefit outweighs risk - limited data available but not known to be harmful in animal studies. Specialist sources indicate suitable for use in prenancy""",],//Ceftriaxone
    ["""Intravenous: 1.5g every 8 hours""","""Broad spectrum Gram-positive and Gram-negative cover. Increased risk of Clostridioides difficile""","""Not known to be harmful""",],//Cefuroxime
    ["""Intravenous: 1g every 6 hours""","""Can cause blood disorders. FBC before & periodically during treatment""","""Manufacturer advises to avoid; neonatal ‘grey-baby syndrome’ if used in the third trimester """,],//Chloramphenicol
    ["""Oral: 500-750mg BD

Intravenous: 400mg every 8-12 hours
""","""Broad Gram-negative cover including Pseudomonas, some Gram-positive cover. Does not cover Streptococcus pneumoniae. Increased risk of Clostridioides difficile and tendon rupture""","""Avoid use in pregnancy - shown to cause arthropathy in animal studies; safer alternatives are available.

A single dose of ciprofloxacin may be used for the prevention of a secondary case of meningococcal meningitis
""",],//Ciprofloxacin
    ["""Oral: 500-1000mg BD

Intravenous: 500mg BD
""","""Gram-positive, atypical cover & limited Gram-negative cover (Haemophilus & Moraxella). Used mainly for respiratory-tract infections""","""Manufacturer advises avoid, particularly in the first trimester, unless potential benefit outweighs risk""",],//Clarithromycin
    ["""Oral: 150-450mg QDS

Intravenous: 0.6-4.8g daily in 2-4 divided doses
""","""Gram-positive & anaerobic cover. Increased risk of Clostridioides difficile""","""Not known to be harmful""",],//Clindamycin
    ["""Intravenous: 1-2 million units TDS""","""On microbiology advice only""","""Discuss the patient with microbiology. There is limited data on the use of colistin during pregnancy""",],//Colistin
    ["""Oral: 375-625mg TDS

Intravenous: 1.2g TDS
""","""Broad Gram-positive, Gram-negative cover and anaerobic cover""","""Not known to be harmful""",],//Co-amoxiclav
    ["""Intravenous: 120mg/kg daily in 2-4 divided doses for 14-21 days""","""1st line for PCP treatment and prophylaxis. Can cause blood dyscrasias. Monitor FBC with prolonged treatment""","""Avoid in 1st and 3rd trimesters. Discuss with microbiology if needed in 2nd trimester""",],//Co-trimoxazole
    ["""Intravenous: 6-12mg/kg discuss with microbiology""","""Microbiology recommendation only. Wide Gram-positive cover including MRSA. Baseline and weekly CK monitoring is required""","""Discuss patients with microbiology. There is limited data on the use of daptomycin in pregnancy""",],//Daptomycin
    ["""Oral: Loading 200mg, then 100-200mg OD-BD""","""Broad spectrum Gram-positive and Gram-negative cover, anaerobes and atypicals. Used mostly for genito-urinary and respiratory-tract infections""","""Avoid in pregnancy""",],//Doxycycline
    ["""Intravenous: 1000mg OD""","""Very broad spectrum carbapenem. Cover includes ESBL-producing organisms. Does not cover Pseudomonas""","""Limited data on the use of Ertapenem in pregnancy. Discuss patient with microbiology""",],//Ertapenem
    ["""Oral: 250mg-500mg QDS""","""Gram-positive, atypical cover & limited Gram-negative cover (Haemophilus & Moraxella). Used mainly for respiratory tract infections. Also used IV as a prokinetic (ICU).""","""Not known to be harmful""",],//Erythromycin
    ["""Oral: 500-1000mg QDS

Intravenous: 2000mg QDS to 6 times/day
""","""Narrow Gram-positive cover (MSSA, not MRSA). Used for skin/soft-tissue & bone infections. Flucloxacillin is the most superior agent for treating MSSA""","""Not known to be harmful""",],//Flucloxacillin
    ["""Oral: 400mg OD

Intravenous: 400mg OD

Highly bioavailable antifungal
""","""Care required as there as multiple drug interactions""","""Avoid in pregnancy""",],//Fluconazole
    ["""Oral: 200mg BD for 10 days""","""Microbiology approval only. For Clostridioides difficile treatment (resistant cases)""","""Discuss patients with microbiology. There is no human data on the use of fidaxomicin during pregnancy""",],//Fidaxomicin
    ["""Oral: 3g single sachet

Intravenous: 12-24g in 2-3 divided doses
""","""Oral for resistant UTIs where indicated by sensitivities. Intravenous where microbiology directed""","""Discuss patients with microbiology. There is limited human data on the use of fosfomycin during pregnancy""",],//Fosfomycin
    ["""Oral: 500mg TDS

Highly bioavailable antibiotic. There is an intravenous preparation, if required discuss with pharmacy
""","""Anti-staphylococcal agent. Use only in combination with another agent (rapid resistance with monotherapy)""","""There is limited data on the use of fusidic acid in pregnancy. Discuss patients with microbiology""",],//Fusidic acid
    ["""Intravenous: Gentamicin is given at 3-5mg/kg IV

Please use the gentamicin calculator in the therapeutic dose monitoring section
""","""Gram-positive and some Gram-negative cover (works synergistically with other agents) follow therapeutic dose monitoring for guidance""","""Use with microbiology advice only, when benefit outweighs risk. Aminoglycoside dosing and monitoring is more complex in pregnant patients. Potential risks auditory or vestibular nerve damage in the infant""",],//Gentamicin
    ["""Oral: 600mg BD 

Intravenous: 600mg BD
""","""Microbiology recommendation only. Gram-positive cover only, including MRSA. 100% orally bioavailable. Licenced for 4 weeks use only. Risk of interactions with medications including anti-psychotics - MAOIs. Warn patients of risks of optic neuritis, peripheral neuropathy and bone marrow suppression. Weekly monitoring of FBC is important""","""Limited data on the use of linezolid in pregnancy. Discuss with microbiology before use""",],//Linezolid
    ["""Intravenous: 1000mg TDS, central nervous system dose 2000mg TDS""","""Very broad spectrum carbapenem. Cover includes ESBL-producing organisms. Covers Pseudomonas""","""Limited data on the use of meropenem in pregnancy. Use only when benefit outweighs risk & discuss with microbiology""",],//Meropenem
    ["""Oral: 400mg TDS

Intravenous: 500mg TDS
""","""Anaerobic cover and in Giardiasis. Avoid alcohol whilst taking metronidazole""","""Low risk in pregnancy. But avoid high dose regime for bacterial vaginosis in first trimester""",],//Metronidazole
    ["""Oral: 400mg OD

Intravenous: 400mg OD
""","""Specialist TB use""","""Avoid. Discuss patient with microbiology if lack of alternatives""",],//Moxifloxacin
    ["""Oral: 50mg QDS or 100mg BD""","""UTI treatment. Ineffective if eGFR <45ml/min""","""Avoid in 3rd trimester as risk of neonatal haemolysis""",],//Nitrofurantoin
    ["""Oral: 250-500mg QDS""","""Narrow spectrum cover for Gram-positive including Streptococci. Has limited anaerobic cover""","""Not known to be harmful""",],//Penicillin V
    ["""Oral: 300-600mg BD

Highly bioavailable antibiotic
""","""TB & anti-staphylococcal agent. Use only in combination with another agent for staphylococcal treatment (rapid resistance with monotherapy)""","""Low risk in pregnancy when used for TB treatment. Risk of neonatal bleeding may be increased in the 3rd trimester""",],//Rifampicin
    ["""Intravenous: 4.5g TDS""","""Broad spectrum Gram-positive, Gram-negative and anaerobic cover including Pseudomonas""","""Limited data on the use of piperacillin-tazobactam in pregnancy. Use only when benefit outweighs risk & discuss with microbiology
""",],//Piperacillin-tazobactam
    ["""Intravenous: Please use the teicoplanin calculator in the therapeutic dose monitoring section
""","""Gram-positive agent only (including MRSA). Useful in skin/soft-tissue & bone infections and in combination for other indications""","""Limited data on the use of teicoplanin in pregnancy. Potential risk of ototoxicity & nephrotoxicity to the foetus. Discus with microbiology before use""",],//Teicoplanin
    ["""Intravenous: 1-2g BD-TDS""","""Use on microbiology advice only. Has some cover for ESBL-producing organisms""","""Discuss patients with microbiology. There are no human data on the use of temocillin during pregnancy""",],//Temocillin
    ["""Intravenous: 100mg loading dose then 50mg BD""","""Use on microbiology advice only. Should not be used in bloodstream infections. Does not cover Pseudomonas""","""Avoid in pregnancy""",],//Tigecycline
    ["""Oral: 200mg BD""","""UTI treatment. Limited by resistance""","""Avoid in first trimester as can lead to neural tube defects""",],//Trimethoprim
    ["""Intravenous: please use the vancomycin calculator in the therapeutic dose monitoring section""","""Gram-positive agent only (including MRSA). Follow trust therapeutic dose monitoring""","""Use where benefit outweighs risk. Discuss with microbiology""",],//Vancomycin
    ["""Oral: Weight <40kg - initially 200mg BD for 2 doses then 100-150mg BD
Weight >=40kg - initially 400mg BD for 2 doses then 200-300mg BD

Intravenous: initially 6mg/kg BD for 2 doses then 3-4mg/kg BD
""","""Care required as multiple drug interactions""","""Discuss patients with microbiology. There is very limited data on the use of voriconazole in pregnancy""",],//Voriconazole






  ];


  void notifyParent()
  {

  }

  @override
  Widget build(BuildContext context) {
    return BloodCulturesEndPage(
        title: "Antimicrobial Information",
        titleBoxColour: kAntimicrobialMaroon,
        firstTextArea: SubBarAndText(
            lowerTitle: "Dosing",
            outputText: antibioticInformationOutputs[indexTicker][0],
            barColour: kAntimicrobialPastelBrown),
        secondTextArea: SubBarAndText(
            lowerTitle: "Additional Information",
            outputText: antibioticInformationOutputs[indexTicker][1],
            barColour: kIconLightGrey),
        thirdTextArea: SubBarAndText(
            lowerTitle: "Pregnancy",
            outputText: antibioticInformationOutputs[indexTicker][2],
            barColour: kAntimicrobialPastelPink),
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
