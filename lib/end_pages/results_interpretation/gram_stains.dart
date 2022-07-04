import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infection/constants.dart';
import 'package:infection/custom_widgets.dart';

class GramStains extends StatefulWidget {
  @override
  _GramStainsState createState() => _GramStainsState();
}

class _GramStainsState extends State<GramStains> {
  List<Widget> selectionTitles = [
    TickerTile(title: 'Select a Gram stain'),
    TickerTile(title: 'Gram negative cocci'),
    TickerTile(title: 'Gram negative cocco-bacilli'),
    TickerTile(title: 'Gram negative diplococci'),
    TickerTile(title: 'Gram negative bacilli (rods)'),
    TickerTile(title: 'Gram positive cocci (clusters)'),
    TickerTile(title: 'Gram positive cocci (chains)'),
    TickerTile(title: 'Gram positive diplococci'),
    TickerTile(title: 'Gram positive rods'),
    TickerTile(title: 'Yeasts'),
  ];

  List<String> gstains = [
    "",
    "This usually represents the presence of Moraxella, which is normally a respiratory pathogen and should be deemed significant in a patient presenting with symptoms consistent with an upper or lower respiratory tract infection.",
    "Gram negative cocco-bacilli may or may not be significant and management depends on the clinical context. Organisms such as Haemophilus, Acinetobacter and Kingella will have this Gram stain morphology.\n\nDepending on the clinical context, it would be prudent to use and agent such as Ceftriaxone until full identification and sensitivities can be established.",
    "Gram negative cocci normally represent Neisseria, either meningitidis or gonorrhea. This can often although not always be determined by the clinical context. \n  \nIn the context of meningitis, the following actions should be taken: \n \n• Patient started on Ceftriaxone 2g BD\n• Patient should be placed in a sideroom\n• Lumbar puncture\n• Notification to Public Health England\n• Chemoprophylaxis of close contacts\n• Discussion with Infection Control Team\n\nIn the context of gonorrhea, the following actions should be taken:\n\n• Patient referred to GUM\n• Appropriate swabs taken as per GUM\n• HIV test\n• Consideration of secondary seeding (joints/heart)\n• Contact tracing",
    "Gram negative rods are usually abdominal/biliary/urinary in origin. They can come from the chest, however, this is more common in patients with an underlying lung pathology. These are rarely contaminants.\n\nThe following actions should be undertaken:\n\n• Antibiotics started in line with guidance\n• Send urine culture for MCS\n• Low threshold for abdominal imaging\n• If patient is previously catheterised, change catheter with a stat dose of Amikacin\n\nIn a returning traveller consider TYPHOID",
    "These represent Staphylococci which can cause infections related to long-lines and prosthetic devices. They can also cause skin/soft-tissue infections, as well as infections in the bones, joints and back. Staphylococcus aureus in particular can cause endocarditis.\n\nIf there is clinical suspicion of an infection, the patient should be treated empirically.",
    "These represent Streptococci, which can cause a range of infections, depending on the organism. These infections can range from cellulitis to necrotising fasciitis and endocarditis.\n\nThey are not often contaminants and if there is not clear source of infection, a Glycopeptide (Teicoplanin/Vancomycin) should be used empirically.",
    "Gram positive diplococci usually relate to Streptococcus pneumoniae, which would be most significant most commonly in pneumonia, however, Meningitis and Endocarditis need to be considered.\n\nIn consideration of pneumococcus, the following actions should be instituted:\n\n• Travel history to consider potential resistance\n• HIV testing\n• Concurrent macrolide therapy\n• Low threshold for LP if considering meningitis",
    "These are mostly contaminants, but should be considered potentially significant in the context of neonates, pregnant women, elderly, immunocompromised or immunosuppressed where Listeria is a possibility or where line sepsis may be a differential.\n\nThere are other Gram positive rods such as Clostridia, Bacillus, Actinomyces and Nocardia which may be relevant, but Microbiology will provide further advice regarding these.",
    "If yeasts are seen on the Gram stain, this should be considered a serious and significant finding.\n\nYeasts in a blood culture can be associated with line infection, intra-abdominal collections and endocarditis. They can also be associated with an endophthalmitis.\n\nThe following actions should be instituted:\n\n• Remove any long lines\n• Start Anidulafungin\n• Repeat blood culture\n• Abdominal imaging\n• Echocardiogram\n• Ophthalmology review\n• Urine MCS",
  ];

  int indexTicker = 0;

  List<bool> abxSelection = [true, false, false];

  void notifyParent() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BloodCulturesEndPage(
      title: "Gram Stain",
      selectionTitles: selectionTitles,
      onSelectedItemChanged: (index) {
        setState(() {
          indexTicker = index;
        });
      },
      notifyParent: notifyParent,
      firstTextArea: SubBarAndText(
          lowerTitle: "Information",
          // outputText: "outputText",
          outputText: gstains[indexTicker],
          barColour: kSubTitleDarkerYellow),
    );
  }
}
