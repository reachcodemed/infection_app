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
    TickerTile(title: 'Cloarithromycin'),
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
    TickerTile(title: 'Teicoplanin'),
    TickerTile(title: 'Temocillin'),
    TickerTile(title: 'Tigecycline'),
    TickerTile(title: 'Trimethoprim'),
    TickerTile(title: 'Vancomycin'),
    TickerTile(title: 'Voriconazole'),
  ];

  int indexTicker = 0;


  void notifyParent()
  {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return BloodCulturesEndPage(
        title: "Antimicrobial Information",
        titleBoxColour: kAntimicrobialMaroon,
        firstTextArea: const SubBarAndText(
            lowerTitle: "Dosing",
            outputText: "Hello",
            barColour: kAntimicrobialPastelBrown),
        secondTextArea: const SubBarAndText(
            lowerTitle: "Additional Information",
            outputText: "Hello",
            barColour: kIconLightGrey),
        thirdTextArea: const SubBarAndText(
            lowerTitle: "Pregnancy",
            outputText: "Hello",
            barColour: kAntimicrobialPastelPink),
        selectionTitles: selectionTitles,
        onSelectedItemChanged: (index)
        {

        },
        notifyParent: notifyParent);

  }
}
