import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infection/custom_widgets.dart';
import 'package:infection/constants.dart';

class Organisms extends StatefulWidget {
  @override
  _OrganismsState createState() => _OrganismsState();
}

class _OrganismsState extends State<Organisms> {
  List<Widget> selectionTitles = [
    TickerTile(title: 'Select a Gram stain'),
    TickerTile(title: 'Acinetobacter'),
    TickerTile(title: 'Aeromonas'),
    TickerTile(title: 'Bacillus'),
    TickerTile(title: 'Bacteroides'),
    TickerTile(title: 'Citrobacter'),
    TickerTile(title: 'Enterococcus faecalis'),
    TickerTile(title: 'Enterococcus faecium'),
    TickerTile(title: 'Enterobacter'),
    TickerTile(title: 'Escherichia coli'),
    TickerTile(title: 'Fusobacterium'),
    TickerTile(title: 'Haemophilus influenzae'),
    TickerTile(title: 'Klebsiella'),
    TickerTile(title: 'Kocuria'),
    TickerTile(title: 'Micrococcus'),
    TickerTile(title: 'Moraxella'),
    TickerTile(title: 'Morganella'),
    TickerTile(title: 'MRSA'),
    TickerTile(title: 'Neisseria gonorrhoea'),
    TickerTile(title: 'Neisseria meningitidis'),
    TickerTile(title: 'Prevotella'),
    TickerTile(title: 'Proteus'),
    TickerTile(title: 'Providencia'),
    TickerTile(title: 'Pseudomonas'),
    TickerTile(title: 'Serratia'),
    TickerTile(title: 'Staphylococcus aureus - MSSA'),
    TickerTile(title: 'Staphylococcus capitis'),
    TickerTile(title: 'Staphylococcus epidermidis'),
    TickerTile(title: 'Staphylococcus haemolyticus'),
    TickerTile(title: 'Staphylococcus hominis'),
    TickerTile(title: 'Staphylococcus lugdunensis'),
    TickerTile(title: 'Streptococcus agalactiae'),
    TickerTile(title: 'Streptococcus anginosus'),
    TickerTile(title: 'Streptococcus constellatus'),
    TickerTile(title: 'Streptococcus dysgalactiae'),
    TickerTile(title: 'Streptococcus gallolyticus'),
    TickerTile(title: 'Streptococcus intermedius'),
    TickerTile(title: 'Streptococcus mitis'),
    TickerTile(title: 'Streptococcus oralis'),
    TickerTile(title: 'Streptococcus parasanguis'),
    TickerTile(title: 'Streptococcus pneumoniae'),
    TickerTile(title: 'Streptococcus pyogenes'),
    TickerTile(title: 'Streptococcus sanguis'),
  ];

  List<String> organisms = [
    //Select an organism
    "",
    //Acinetobacter
    "This is a gram-negative organism which is usually associated with line infections and can cause infections in other prosthetic devices. Outside of these situations, it may well be a contaminant.",
    //Aeromonas
    "This organism is associated with contaminated water and can cause a gastroenteritis or a cause of wound infections. Rarely it can also cause necrotising fasciitis. It should be considered a pathogen when found in the blood and treated with Ciprofloxacin.",
    //Bacillus
    "This is nearly always a contaminant, however, in the context of being cultured from a long-line, particularly where that line is an immunocompromised/suppressed patient, it should not be ignored and a discussion should take place with Microbiology regarding it",
    //Bacteroides
    "This is an anaerobe and should be considered a pathogen and treated with Metronidazole. Its common presentation will be from intra-abdominal infections, in particular collections, but can also be found in diabetic foot sepsis" +
        "\n" +
        "\n" +
        "Whilst treatment is with Metronidazole, it is unlikely to be the sole pathogen implicated in infection and so a discussion should be had with Microbiology about the need for any other antimicrobials.",
    //Citrobacter
    "This is a Gram-negative organism and as with most Gram-negative bacteraemias is associated with abdominal/urinary/biliary infections. Urine MCS should be sent as well as having a low threshold for abdominal imaging" +
        "\n" +
        "\n" +
        "The species Citrobacter freundii is one of the ESCAPPM organisms which demonstrates inducible resistance and so treatment should be with Ciprofloxacin or a Carbapenem depending on sensitivities",
    //Enterococcus faecalis
    "This is a low-pathogenicity organism, which can be implicated in a number of infections. Most commonly associated with urinary and intra-abdominal infections as well as diabetic foot infections, but also has a significant propensity for endocarditis. Patient should always have an echocardiogram with an Enterococcal bacteraemia" +
        "\n" +
        "\n" +
        "Treatment of the faecalis species is nearly always with Amoxicillin as the overwhelming majority of faecalis isolates are sensitive. Dose and duration depends on the underlying pathology.",
    //Enterococcus faecium
    "This is a low-pathogenicity organism, which can be implicated in a number of infections. Most commonly associated with urinary and intra-abdominal infections as well as diabetic foot infections, but also has a significant propensity for endocarditis. Patient should always have an echocardiogram with an Enterococcal bacteraemia" +
        "\n" +
        "\n" +
        "Treatment of the faecium species is nearly always with Teicoplanin as the overwhelming majority of faecium isolates are resistant to Amoxicillin. Dose and duration depends on the underlying pathology.",
    //Enterobacter
    "This is a Gram-negative organism and as with most Gram-negative bacteraemias is associated with abdominal/urinary/biliary infections. Urine MCS should be sent as well as having a low threshold for abdominal imaging" +
        "\n" +
        "\n" +
        "This is one of the ESCAPPM organisms which demonstrates inducible resistance and so treatment should be with Ciprofloxacin or a Carbapenem depending on sensitivities.",
    //Escherichia coli
    "This is a Gram-negative organism and as with most Gram-negative bacteraemias is associated with abdominal/urinary/biliary infections. Urine MCS should be sent as well as having a low threshold for abdominal imaging" +
        "\n" +
        "\n" +
        "This organism can also be implicated in lower respiratory tract infections, however, this is more commonly seen in patients with underlying lung disease or those who have been in hospital for a sustained period or been ventilated.",
    //Fusobacterium
    "This is an anaerobe and should be considered a pathogen and treated with Metronidazole. Its common presentation will be from intra-abdominal infections, in particular collections, but can also be found in diabetic foot sepsis" +
        "\n" +
        "\n" +
        "Whilst treatment is with Metronidazole, it is unlikely to be the sole pathogen implicated in infection and so a discussion should be had with Microbiology about the need for any other antimicrobials.",
    //Haemophilus influenzae
    "This is a significant organism to find in a blood culture." +
        "\n" +
        "\n" +
        "It can cause a pneumonia +/- endocarditis and should be treated with Ceftriaxone in the first instance." +
        "\n" +
        "\n" +
        "In the case of Haemophilus influenzae group B, it should be notified to the local Health Protection Unit on 0344 326 2052",
    //Klebsiella
    "This is a Gram-negative organism and as with most Gram-negative bacteraemias is associated with abdominal/urinary/biliary infections. Urine MCS should be sent as well as having a low threshold for abdominal imaging" +
        "\n" +
        "\n" +
        "This organism can also be implicated in lower respiratory tract infections, however, this is more commonly seen in patients with underlying lung disease or those who have been in hospital for a sustained period or been ventilated.",
    //Kocuria
    "This is almost always a contaminant. It is possible that in the context of prosthetic devices this may be a pathogen, however it is extremely uncommon",
    //Micrococcus
    "This is almost always a contaminant. It is possible that in the context of prosthetic devices this may be a pathogen, however it is extremely uncommon",
    //Moraxella
    "Moraxella bacteraemia is usually only found in the context of respiratory tract infections. It can cause infections of the lower and upper respiratory tract. It should be considered a pathogen when found in blood cultures",
    //Morganella
    "This is a Gram-negative organism and as with most Gram-negative bacteraemias is associated with abdominal/urinary/biliary infections. Urine MCS should be sent as well as having a low threshold for abdominal imaging" +
        "\n" +
        "\n" +
        "This is one of the ESCAPPM organisms which demonstrates inducible resistance and so treatment should be with Ciprofloxacin or a Carbapenem depending on sensitivities",
    //MRSA
    "This is a significant finding in a blood culture and should never be considered a contaminant. Potential sources include skin/soft-tissue, bones, joints, back, heart, infected prosthetic devices." +
        "\n" +
        "\n" +
        "Undertake the following actions: " +
        "\n" +
        "• Discuss with Microbiology regarding antibiotics" +
        "" +
        "\n" +
        "• Isolate the patient in a sideroom" +
        "\n" +
        "• Send a repeat blood culture" +
        "" +
        "\n" +
        "• Echocardiogram" +
        "" +
        "\n" +
        "• Low threshold for imaging bones/joints/back" +
        "" +
        "• Remove any long-lines" +
        "\n" +
        "\n" +
        "Treatment duration for Staphylococcus aureus bacteraemia is always at least 2 weeks but may be longer there is a deeper infection",
    //Neisseria g
    "Neisseria gonorrhoea bacteraemia is found in the context of gonorrhoea. It can seed to other parts of the body and can present as a septic arthritis and can also cause endocarditis" +
        "\n" +
        "\n" +
        "It is important that the patient is referred to the GUM physicians to ensure that holistic testing and management is occurring" +
        "\n" +
        "\n" +
        "Treatment is with Ceftriaxone, however, there is always a possibility of multiple infections in the context of sexual contact, so other antimicrobials may be required empirically such as Doxycycline and Metronidazole",
    //Neisseria m
    "Neisseria meningitidis bacteraemia is most commonly found in the context of meningitis, however, can be implicated in other infections, although this is less common." +
        "\n" +
        "\n" +
        "In the context of this bacteraemia, undertake the following actions: " +
        "\n" +
        "• Start the patient on Ceftriaxone 2g BD" +
        "" +
        "\n" +
        "• Isolate the patient in a sideroom" +
        "\n" +
        "• Send a repeat blood culture" +
        "" +
        "\n" +
        "• Lumbar puncture" +
        "" +
        "\n" +
        "• This is a notifiable infection and it should be reported to the local Health Protection Unit on 0344 326 2052",
    //Prevotella
    "This is an anaerobe and should be considered a pathogen and treated with Metronidazole. Its common presentation will be from intra-abdominal infections, in particular collections, but can also be found in diabetic foot sepsis" +
        "\n" +
        "\n" +
        "Whilst treatment is with Metronidazole, it is unlikely to be the sole pathogen implicated in infection and so a discussion should be had with Microbiology about the need for any other antimicrobials",
    //Proteus
    "This is a Gram-negative organism and as with most Gram-negative bacteraemias is associated with abdominal/urinary/biliary infections. Urine MCS should be sent as well as having a low threshold for abdominal imaging" +
        "\n" +
        "\n" +
        "This organism can also be implicated in lower respiratory tract infections, however, this is more commonly seen in patients with underlying lung disease or those who have been in hospital for a sustained period or been ventilated",
    //Providencia
    "This is a Gram-negative organism and as with most Gram-negative bacteraemias is associated with abdominal/urinary/biliary infections. Urine MCS should be sent as well as having a low threshold for abdominal imaging" +
        "\n" +
        "\n" +
        "This is one of the ESCAPPM organisms which demonstrates inducible resistance and so treatment should be with Ciprofloxacin or a Carbapenem depending on sensitivities",
    //Pseudomonas
    "This is a Gram-negative organism and as with most Gram-negative bacteraemias is associated with abdominal/urinary/biliary infections. Urine MCS should be sent as well as having a low threshold for abdominal imaging" +
        "\n" +
        "\n" +
        "This organism can also be implicated in lower respiratory tract infections, however, this is more commonly seen in patients with underlying lung disease or those who have been in hospital for a sustained period or been ventilated",
    //Serratia
    "This is a Gram-negative organism and as with most Gram-negative bacteraemias is associated with abdominal/urinary/biliary infections. Urine MCS should be sent as well as having a low threshold for abdominal imaging" +
        "\n" +
        "\n" +
        "This is one of the ESCAPPM organisms which demonstrates inducible resistance and so treatment should be with Ciprofloxacin or a Carbapenem depending on sensitivities",
    //Staphylococcus - MSSA
    "This is a significant finding in a blood culture and should never be considered a contaminant. Potential sources include skin/soft-tissue, bones, joints, back, heart, infected prosthetic devices." +
        "\n" +
        "\n" +
        "Undertake the following actions: " +
        "\n" +
        "• Discuss with Microbiology regarding antibiotics" +
        "" +
        "\n" +
        "• Send a repeat blood culture" +
        "" +
        "\n" +
        "• Echocardiogram" +
        "" +
        "\n" +
        "• Low threshold for imaging bones/joints/back" +
        "" +
        "• Remove any long-lines" +
        "\n" +
        "\n" +
        "Treatment duration for Staphylococcus aureus bacteraemia is always at least 2 weeks but may be longer there is a deeper infection.",
    //Staphylococcus capitis
    "This organism is one of the Coagulase-negative staphylococci (CoNS). They are mostly considered to be contaminants when found in blood cultures" +
        "\n" +
        "\n" +
        "They can however be significant in the context of long-lines and prosthetic devices. Treatment often involves removal of the line/prosthetic device, however antibiotic treatment may sometimes be required and Teicoplanin would be the treatment of choice",
    //Staphylococcus epidermidis
    "This organism is one of the Coagulase-negative staphylococci (CoNS). They are mostly considered to be contaminants when found in blood cultures" +
        "\n" +
        "\n" +
        "They can however be significant in the context of long-lines and prosthetic devices. Treatment often involves removal of the line/prosthetic device, however antibiotic treatment may sometimes be required and Teicoplanin would be the treatment of choice",
    //Staphylococcus haemolyticus
    "This organism is one of the Coagulase-negative staphylococci (CoNS). They are mostly considered to be contaminants when found in blood cultures." +
        "\n" +
        "\n" +
        "They can however be significant in the context of long-lines and prosthetic devices. Treatment often involves removal of the line/prosthetic device, however antibiotic treatment may sometimes be required and Teicoplanin would be the treatment of choice.",
    //Staphylococcus hominis
    "This organism is one of the Coagulase-negative staphylococci (CoNS). They are mostly considered to be contaminants when found in blood cultures" +
        "\n" +
        "\n" +
        "They can however be significant in the context of long-lines and prosthetic devices. Treatment often involves removal of the line/prosthetic device, however antibiotic treatment may sometimes be required and Teicoplanin would be the treatment of choice",
    //Staphylococcus lugdenensis
    "This organism is one of the Coagulase-negative staphylococci (CoNS). They are mostly considered to be contaminants when found in blood cultures" +
        "\n" +
        "\n" +
        "They can however be significant in the context of long-lines and prosthetic devices. Treatment often involves removal of the line/prosthetic device, however antibiotic treatment may sometimes be required and Teicoplanin would be the treatment of choice",
    //Streptococcus agalactiae
    "Also known as Group B Streptococcus. This organism is most commonly found in maternal and neonatal sepsis, however other infections caused by this organisms are in patients with infected diabetic feet/osteomyelitis as well as endocarditis" +
        "\n" +
        "\n" +
        "Treatment is with Benzylpenicillin, but this may change depending on where the infection is. There should be a low threshold for considering undertaking echocardiograms and MRI scans where appropriate",
    //Streptococcus anginosus
    "Also known as Group F Streptococcus. This organism is one of the Streptococcus milleri group. It should be considered significant when found in the blood. It can cause pyogenic infections in most parts of the body. It can in some instances cause necrotising infections." +
        "\n" +
        "\n" +
        "Treatment is with Benzylpenicillin, but this may change depending on where the infection is. If the organism has caused a collection to develop, primary treatment intervention should be to drain the collection. This is NOT a common cause of endocarditis",
    //Streptococcus constellatus
    "Also known as Group F Streptococcus. This organism is one of the Streptococcus milleri group. It should be considered significant when found in the blood. It can cause pyogenic infections in most parts of the body. It can in some instances cause necrotising infections" +
        "\n" +
        "\n" +
        "Treatment is with Benzylpenicillin, but this may change depending on where the infection is. If the organism has caused a collection to develop, primary treatment intervention should be to drain the collection. This is NOT a common cause of endocarditis",
    //Streptococcus dysgalactiae
    "Also known as Group C/G Streptococcus. This organism is most commonly associated with cellulitis, but can also be a cause of endocarditis and discitis. Patient should routinely have an echocardiogram and there should be a low threshold for performing an MRI in the context of back pain with this organism" +
        "\n" +
        "\n" +
        "Treatment is with Benzylpenicillin, but this may change depending on where the infection is",
    //Streptococcus gallolyticus
    "This organism is the reclassified Streptococcus bovis. It is highly associated with both endocarditis and GI malignancy. All patients with this organism in their blood must have an echocardiogram as well as a colonoscopy to rule out malignancy" +
        "\n" +
        "\n" +
        "Treatment is with Benzylpenicillin, but this may change depending on where the infection is",
    //Streptococcus intermedius
    "Also known as Group F Streptococcus. This organism is one of the Streptococcus milleri group. It should be considered significant when found in the blood. It can cause pyogenic infections in most parts of the body. It can in some instances cause necrotising infections" +
        "\n" +
        "\n" +
        "Treatment is with Benzylpenicillin, but this may change depending on where the infection is. If the organism has caused a collection to develop, primary treatment intervention should be to drain the collection. This is NOT a common cause of endocarditis",
    //Streptococcus mitis
    "This is one of the Viridans-type Streptococci and can cause endocarditis. It is essential to do an echocardiogram in the context of this organism being found in the blood. If endocarditis is excluded, it may be a contaminant, although it is important to rule out other deeper infections such as discitis" +
        "\n" +
        "\n" +
        "If there is a concern of endocarditis, please ensure three sets of blood cultures are sent in total. If treatment is required, the patient should be started on Benzylpenicillin and discussed with Microbiology",
    //Streptococcus oralis
    "This is one of the Viridans-type Streptococci and can cause endocarditis. It is essential to do an echocardiogram in the context of this organism being found in the blood. If endocarditis is excluded, it may be a contaminant, although it is important to rule out other deeper infections such as discitis" +
        "\n" +
        "\n" +
        "If there is a concern of endocarditis, please ensure three sets of blood cultures are sent in total. If treatment is required, the patient should be started on Benzylpenicillin and discussed with Microbiology",
    //Streptococcus parasanguis
    "This is one of the Viridans-type Streptococci and can cause endocarditis. It is essential to do an echocardiogram in the context of this organism being found in the blood. If endocarditis is excluded, it may be a contaminant, although it is important to rule out other deeper infections such as discitis" +
        "\n" +
        "\n" +
        "If there is a concern of endocarditis, please ensure three sets of blood cultures are sent in total. If treatment is required, the patient should be started on Benzylpenicillin and discussed with Microbiology",
    //Streptococcus pneumoniae
    "This is usually the cause of a pneumonia. It is however important to exclude meningitis and it is not uncommon to find the two pathologies together. There should also be a low threshold for considering pneumococcal endocarditis which carries a high mortality with it." +
        "\n" +
        "\n" +
        "The treatment for pneumococcal pneumonia is Benzylpenicillin and this would also be the treatment for endocarditis. In the case of meningitis, you would need to use Ceftriaxone at CNS doses 2g BD" +
        "\n" +
        "\n" +
        "Three further important considerations are to undertake HIV testing in these patients, to consider any relevant travel history in the context of resistant pneumococcus - discuss with a Microbiologist if there is a travel history and lastly, if the patient is eligible for the pneumococcal vaccine in the community, they should receive it",
    //Streptococcus pyogenes
    "Also known as Group A Streptococcus. This organism is significant and is a major cause of cellulitis, throat infections and necrotising fasciitis." +
        "\n" +
        "\n" +
        "Treatment is with Benzylpenicillin, but the addition of anti-toxin agents such as Clindamycin and Linezolid may be desirable depending on the underlying pathology. In the case of necrotising fasciitis and uncontrolled sepsis, it may be necessary to administer Intravenous Immunoglobulin (IVIG) but this is nearly always done in the Critical Care setting." +
        "\n" +
        "\n" +
        "Invasive Group A Streptococcus (iGAS) is a notifiable infection and it should be reported to the local Health Protection Unit on 0344 326 2052",
    //Streptococcus sanguis
    "This is one of the Viridans-type Streptococci and can cause endocarditis. It is essential to do an echocardiogram in the context of this organism being found in the blood. If endocarditis is excluded, it may be a contaminant, although it is important to rule out other deeper infections such as discitis." +
        "\n" +
        "\n" +
        "If there is a concern of endocarditis, please ensure three sets of blood cultures are sent in total. If treatment is required, the patient should be started on Benzylpenicillin and discussed with Microbiology.",
  ];

  int indexTicker = 0;

  List<bool> abxSelection = [true, false, false];

  void notifyParent() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BloodCulturesEndPage(
      title: "Organisms",
      selectionTitles: selectionTitles,
      onSelectedItemChanged: (index) {
        setState(() {
          indexTicker = index;
        });
      },
      notifyParent: notifyParent,
      firstTextArea: SubBarAndText(
          lowerTitle: "Information",
          //outputText: "outputText",
          outputText: organisms[indexTicker],
          barColour: kSubTitleDarkerYellow),
    );
  }
}
