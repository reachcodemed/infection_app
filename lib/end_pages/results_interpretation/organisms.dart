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
    TickerTile(title: 'Staphylococccus capitis'),
    TickerTile(title: 'Staphylococccus epidermidis'),
    TickerTile(title: 'Staphylococccus haemolyticus'),
    TickerTile(title: 'Staphylococccus hominis'),
    TickerTile(title: 'Staphylococccus lugdunesis'),
    TickerTile(title: 'Streptococcus agalactiae'),
    TickerTile(title: 'Streptococcus anginosus'),
    TickerTile(title: 'Streptococcus constellatus'),
    TickerTile(title: 'Streptococcus dysgalactiae'),
    TickerTile(title: 'Streptococcus gallolyticus'),
    TickerTile(title: 'Streptococcus intermidius'),
    TickerTile(title: 'Streptococcus mitis'),
    TickerTile(title: 'Streptococcus oralis'),
    TickerTile(title: 'Streptococcus paransanguis'),
    TickerTile(title: 'Streptococcus pneumoniae'),
    TickerTile(title: 'Streptococcus pyogenes'),
    TickerTile(title: 'Streptococcus sanguis'),
    
  ];

  int indexTicker = 0;

  List<bool> abxSelection = [true,false,false];

  void notifyParent()
  {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return BloodCulturesEndPage(
        title: "Organisms",
        selectionTitles: selectionTitles,
        onSelectedItemChanged: (index)
          {

          },
        notifyParent: notifyParent,

      firstTextArea: const SubBarAndText(
          lowerTitle: "Information",
          outputText: "outputText",
          barColour: kSubTitleDarkerYellow),
    );

  }
}

