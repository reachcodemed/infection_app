import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class WillThisCover extends StatefulWidget {
  @override
  _WillThisCoverState createState() => _WillThisCoverState();
}

class _WillThisCoverState extends State<WillThisCover> {

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
  """• Abdominal (++) Good penetration into collections

• Bone (++) Good penetration but shouldnt be used as monotherapy

• CNS (+/-) Poor penetration except in neonates

• Genital (+/-) Resistance is high in Gonorrhoea

• Heart (+) Used as a synergistic agent in endocarditis

• Hepatobiliary (++) Good penetration into the biliary tree

• Respiratory (+/-) Poor lung penetration

• Skin/Soft-tissue (+) Good skin activity but not a primary agent

• Urinary (++) Good penetration into the urinary tract
""",//Amikacin
  """• Abdominal (+/-) Good penetration but high
resistance

• Bone (+) Good penetration for sensitive pathogens, particularly enterococcus

• CNS (+) Very good penetration, used for Listeria

• Genital (-) No real activity

• Heart (+) Used in Enterococcal endocarditis

• Hepatobiliary (+) Good penetration but lots of resistance except to Enterococcus

• Respiratory (++) Good activity against S.pneumoniae

• Skin/Soft-tissue (+) Good activity against Streptococcal causes

• Urinary (+/-) Good penetration but high resistance

""",//Amoxicillin
  """• Abdominal (+) Activity against enteric pathogens such as Salmonella and Campylobacter

• Bone (+) Good penetration for sensitive pathogens

• CNS (+/-) Good penetration in inflamed meninges

• Genital (++) Good activity against Chlamydia and some against Gonorrhoea

• Heart (+/-) Variable cardiac activity

• Hepatobiliary (-) No real activity

• Respiratory (++) Good penetration and activity particularly atypical pathogens

• Skin/Soft-tissue (+) Good activity against skin pathogens

• Urinary (-) No real activity
""",//Azithromycin
  """• Abdominal (+/-) Poor activity except for sensitive pathogens

• Bone (+) Good pentration and activity against sensitive pathogens

• CNS (-) Poor penetration

• Genital (+/-) High resistance in Gonorrhoea

• Heart (++) Good activity against Streptococcal endocarditis

• Hepatobiliary (+/-) Poor activity except for sensitive pathogens

• Respiratory (+) Good activity against S.pneumoniae

• Skin/Soft-tissue (++) Good activity against streptococcal causes

• Urinary (-) No real activity

""",//Benzylpenicillin
  """• Abdominal (+/-) Limited activity

• Bone (+/-) Limited activity

• CNS (-) No activity

• Genital (-) No acitivty

• Heart (-) No activity

• Hepatobiliary (+/-) Limited activity

• Respiratory (+/-) Limited activity

• Skin/Soft-tissue (+) Some activity

• Urinary (++) Good activity against sensitive pathogens
""",//Cefalexin
  """• Abdominal (++) Good activity particularly against Pseudomonas

• Bone (++) Good activity particularly against Pseudomonas

• CNS (++) Good activity at higher dosage

• Genital (-) No activity

• Heart (+/-) Limited activity in endocarditis

• Hepatobiliary (++) Good activity particularly against Pseudomonas

• Respiratory (++) Good activity particularly against Pseudomonas

• Skin/Soft-tissue (++) Good activity against most pathogens

• Urinary (++) Good activity particularly against Pseudomonas
""",//Ceftazidime
  """• Abdominal (++) Good activity against abdominal pathogens

• Bone (++) Good activity and penetration

• CNS (++) Good penetration and activity at higher dosage

• Genital (+) Good activity against Gonorrhoea

• Heart (++) Good activity for most pathogens causing endocarditis

• Hepatobiliary (++) Good activity against most pathogens

• Respiratory (++) Good activity and penetration

• Skin/Soft-tissue (++) Good activity

• Urinary (++) Good activity
""",//Ceftiraxone
  """• Abdominal (+) Reasonable activity, limited by resistance

• Bone (+) Good activity to sensitive pathogens

• CNS (-) No activity

• Genital (+) Activity against Gonorrhoea

• Heart (+/-) Limited cardiac activity

• Hepatobiliary (+) Reasonable activity, limited by resistance

• Respiratory (+) Good activity

• Skin/Soft-tissue (+ Good activity

• Urinary (+) Good activity to sensitive pathogens
""",//Cefuroxime
  """• Abdominal (++) Good activity against most pathogens

• Bone (++) Good activity and penetration

• CNS (++) Good penetration, useful in Penicillin allergy

• Genital (-) Limited activity

• Heart (+/-) Limited activity

• Hepatobiliary (++) Good activity against most pathogens

• Respiratory (++) Good activity

• Skin/Soft-tissue (++) Good activity against most pathogens

• Urinary (++) Good activity against most pathogens
 """,//Chlroamphenicol
  """• Abdominal (++) Good activity, useful in Penicillin allergy

• Bone (+) Good penetration, limited by resistance

• CNS (+) Reasonable activity and penetration

• Genital (+/-) Resistance against Gonorrhoea

• Heart (-) No activity

• Hepatobiliary (++) Good activity, useful in Penicillin allergy

• Respiratory (++) Good activity

• Skin/Soft-tissue (+) Good activity

• Urinary (++)
""",//Ciprofloxacin
  """• Abdominal (+) Limited activity against certain enteric pathogens

• Bone (++) Good activity

• CNS (+/-)

• Genital (+) Active against Chlamydia

• Heart (+/-) Limited activity

• Hepatobiliary (-) No real activity

• Respiratory (++) Good activity, particularly against atypical pathogens

• Skin/Soft-tissue (++) Good activity, useful in Penicillin allergy

• Urinary (-) No real activity
""",//Clarithromycin
  """• Abdominal (+) Good anaerobic cover, useful in Metronidazole allergy

• Bone (++) Good penetration and activity

• CNS (-) No activity

• Genital (-) No activity

• Heart (-) No activity

• Hepatobiliary (+) Good anaerobic cover, useful in Metronidazole allergy

• Respiratory (+) Reasonable activity agaisnt certain pathogens

• Skin/Soft-tissue (++) Good penetration and activity

• Urinary (-) No activity
""",//Clindamycin
  """• Abdominal (++) Good activity

• Bone (+/-) Variable activity

• CNS (-) No activity

• Genital (-) No activity

• Heart (-) No activity

• Hepatobiliary (++) Good activity

• Respiratory (+) Reasonable activity

• Skin/Soft-tissue (+/-) Variable activity

• Urinary (++) Good activity
""",//Colistin
  """• Abdominal (++) Good activity

• Bone (++) Good bone penetration

• CNS (-) No real penetration

• Genital (-) No activity against most STIs

• Heart Some activity but not a usual agent(+/-)

• Hepatobiliary (++) Good activity and penetration

• Respiratory (++) Good activity and penetration

• Skin/Soft-tissue (++) Good activity against majority of pathogens

• Urinary (+) Good penetration but some resistance
""",//Co-amoxiclav
  """• Abdominal (+) Reasonable activity

• Bone (+) Good activity

• CNS (++) Good activity and penetration

• Genital (-) No activity

• Heart (+) Good activity for Staphylococcus aureus

• Hepatobiliary (+) Reasonable activity

• Respiratory (+) Good activity

• Skin/Soft-tissue (+) Good activity

• Urinary (+) Good activity
""",//Co-trimoxazole
  """• Abdominal (+/-) Good activity against Enterococci

• Bone (+) Good activity against Enterococci

• CNS (-) No activity

• Genital (-) No activity

• Heart (+) Reasonable activity - not a primary agent

• Hepatobiliary (+) Good activity against Enterococci

• Respiratory (-) No activity

• Skin/Soft-tissue (+) Good activity

• Urinary (+) Good activity against Enterococci
""",//Daptomycin
  """• Abdominal (-) No real activity

• Bone (+) Good activity and penetration

• CNS (-) No activity

• Genital (++) Active against Chlamydia

• Heart (-) No real activity

• Hepatobiliary (-) No real activity

• Respiratory (+) Good activity, particularly against atypical pathogens

• Skin/Soft-tissue (++ Good activity

• Urinary (-) No real activity
""",//Doxycycline
  """• Abdominal (++) Good activity

• Bone (++) Good activity

• CNS (-) No activity

• Genital (-) No activity

• Heart (+) Reasonable activity - not a primary agent

• Hepatobiliary (++) Good activity

• Respiratory (++) Good activity

• Skin/Soft-tissue (++) Good activity

• Urinary (++) Good activity
""",//Ertapenem
  """• Abdominal (++) Limited activity against certain enteric pathogens

• Bone (+) Good activity

• CNS (-) No activity

• Genital (+) Active against Chlamydia

• Heart (-) No activity

• Hepatobiliary (+/-) No real activity

• Respiratory (+/-) Good activity, particularly in pregnancy

• Skin/Soft-tissue (++) Good activity, useful in Penicillin allergy

• Urinary (-) No real activity
""",//Erythromycin
  """• Abdominal (-) No real activity

• Bone (+) Good activity, limited to Staphylococcus aureus

• CNS (-) No activity

• Genital (-) No activity

• Heart (+) Good activity, limited to Staphylococcus aureus

• Hepatobiliary (-) No real activity

• Respiratory (+) Good activity, limited to Staphylococcus aureus

• Skin/Soft-tissue (++) Good activity, limited to Staphylococcus aureus

• Urinary (-) No real activity
""",
  """ """,//Flucloxacillin
  """• Abdominal (+/-) Active but not licensed

• Bone (+) Active but not licensed

• CNS (+) Active but not licensed

• Genital (-) No real activity

• Heart (-) No real activity

• Hepatobiliary (+/-) Active but not licensed

• Respiratory (++) Good activity

• Skin/Soft-tissue (-) No real activity

• Urinary (++) Good activity
""",//Fosfomycin
  """• Abdominal (-) No activity

• Bone (++) Good activity - but adjunctive not monotherapy

• CNS (-) No activity

• Genital (-) No activity

• Heart (-) No activity

• Hepatobiliary (-) No activity

• Respiratory (+/-) Limited activity - adjunctive

• Skin/Soft-tissue (++) Good activity

• Urinary (-) No activity
""",//Fusidic Acid
  """• Abdominal (++) Good penetration into collections

• Bone (++) Good penetration but should not be used as monotherapy

• CNS (+/-) Poor penetration except in neonates

• Genital (+/-) Resistance is high in Gonorrhoea

• Heart (+) Used as a synergistic agent in endocarditis

• Hepatobiliary (++) Good penetration into the biliary tree

• Respiratory (+/-) Poor lung penetration

• Skin/Soft-tissue (+) Good skin activity but not a primary agent

• Urinary (++) Good penetration into the urinary tract
""",//Gentamicin
  """• Abdominal (+) Good activity against Enterococci and MRSA

• Bone (+) Good activity against Enterococci and MRSA

• CNS (++) Good activity and penetration

• Genital (-) No activity

• Heart (+/-) Reasonable activity - not primary agent

• Hepatobiliary (+) Good activity against Enterococci and MRSA

• Respiratory (++) Good activity and penetration

• Skin/Soft-tissue (++) Good activity

• Urinary (+) Good activity against Enterococci and MRSA
""",//Linezolid
  """• Abdominal (++) Good activity

• Bone (++) Good activity

• CNS (++) Good activity at higher dosage

• Genital (+/-) Limited activity

• Heart (+/-) Reasonable activity - not primary agent

• Hepatobiliary (++) Good activity

• Respiratory (++) Good activity

• Skin/Soft-tissue (++) Good activity

• Urinary (++) Good activity
""",//Meropenem
    """• Abdominal (++) Good anaerobic cover

• Bone (++) Good anaerobic cover

• CNS (+) Good anaerobic cover

• Genital (+) Good anaerobic cover

• Heart (-) No activity

• Hepatobiliary (++) Good anaerobic cover

• Respiratory (+) Good anaerobic cover

• Skin/Soft-tissue (++) Good anaerobic cover

• Urinary (+/-) No activity outside of a colovesical fistula

""",//Metronidazole
    """• Abdominal (++) Good activity particularly in Penicillin allergy

• Bone (++) Good activity

• CNS (+) Good activity

• Genital (+/-) Resistance in Gonorrhoea

• Heart (-) No real activity

• Hepatobiliary (++) Good activity particularly in Penicillin allergy

• Respiratory (++) Good activity

• Skin/Soft-tissue (+ Good activity

• Urinary (++) Good activity
""",//Moxifloxacin
    """• Abdominal (-) No activity

• Bone (-) No activity

• CNS (-) No activity

• Genital (-) No activity

• Heart (-) No activity

• Hepatobiliary (-) No activity

• Respiratory (-) No activity

• Skin/Soft-tissue (-) No activity

• Urinary (++) Good activity and penetration

""",//Nitrofurantoin
  """• Abdominal (+/-) Limited activity

• Bone (+/-) Limited activity for certain pathogens

• CNS (+/-) Limited activity in neonates

• Genital (+/-) Resistance in Gonorrhoea

• Heart (+/-) Limited activity in this form

• Hepatobiliary (+/-) Limited activity

• Respiratory (+) Good activity in URT infections

• Skin/Soft-tissue (+) Limited activity to certain pathogens

• Urinary (-) No activity
""",//PenicillinV
  """• Abdominal (+/-) Limited activity

• Bone (++) Good activity - not as monotherapy

• CNS (+/-) Limited activity

• Genital (-) No activity

• Heart (+/-) Limited activity in prosthetic valve endocarditis

• Hepatobiliary (+/-) Limited activity

• Respiratory (+) Good activity, particularly in TB

• Skin/Soft-tissue (++) Good activity - not as monotherapy

• Urinary (-) No activity
""",//Rifampicin
  """• Abdominal (++) Good activity

• Bone (++) Good activity

• CNS (-) No activity

• Genital (-) No activity

• Heart (+) Good activity

• Hepatobiliary (++) Good activity

• Respiratory (++) Good activity

• Skin/Soft-tissue (++) Good activity

• Urinary (++) Good activity
""",//Tazocin
  """• Abdominal (+) Reasonable activity, particularly against Enterococci

• Bone (++) Good activity

• CNS (+/-) Limited activity

• Genital (-) No activity

• Heart (++) Good activity

• Hepatobiliary (+) Reasonable activity, particularly against enterococci

• Respiratory (++) Good activity

• Skin/Soft-tissue (++) Good activity

• Urinary (+/-) Limited activity, good against Enterococci
""",//Teicoplanin
  """• Abdominal (++) Good activity particularly against ESBLS

• Bone (++) Good activity

• CNS (-)

• Genital (-)

• Heart (-)

• Hepatobiliary (++) Good activity particularly againstESBLS

• Respiratory (++) Good activity

• Skin/Soft-tissue (++) Good activity

• Urinary (++) Good activity particularly against ESBLs
""",//Temocillin
  """• Abdominal (++) Good activity - particularly against Enterococci

• Bone (++) Good activity and penetration

• CNS (-) No activity

• Genital (-) No activity

• Heart (-) No activity

• Hepatobiliary (++) Good activity - particularly against Enterococci

• Respiratory (+)

• Skin/Soft-tissue (++) Good cover particularly against Enterococci

• Urinary (++) Good cover particularly against Enterococci
""",//Tigecycline
  """• Abdominal (+) Reasonable activity

• Bone (++) Good cover

• CNS (+/-) Limited cover

• Genital (-) No activity

• Heart (+/-) Limited activity

• Hepatobiliary (+) Reasonable activity

• Respiratory (+) Reasonable activity

• Skin/Soft-tissue (++) Reasonable activity

• Urinary (++) Good activity - moderate resistance

""",//Trimethoprim
  """• Abdominal (+) Reasonable activity, particularly against Enterococci

• Bone (++) Good activity

• CNS (+/-) Limited activity

• Genital (-) No activity

• Heart (++) Good activity

• Hepatobiliary (+) Reasonable activity, particularly against enterococci

• Respiratory (++) Good activity

• Skin/Soft-tissue (++) Good activity

• Urinary (+/-) Limited activity, good against Enterococci
""",//Vancomycin
  ];



  void notifyParent()
  {

  }

  @override
  Widget build(BuildContext context) {
    return BloodCulturesEndPage(
      title: "Will This Antibiotic Cover",
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
          lowerTitle: "Advice",
          outputText: antibioticOutputText[indexTicker],
          barColour: kAntimicrobialPastelBrown),

    );

  }
}
